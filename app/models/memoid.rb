class Memoid < ActiveRecord::Base 
  attr_accessible :title, :note, :public

  scope :public, where(:public => [nil, true])
  scope :private, where(:public => false)
  default_scope order('created_at DESC')


  # Validations
  validates :note, :presence => true
  validates :user_id, :presence => true
  
  #Associations
  belongs_to :user
  belongs_to :topic
  has_many :release_dates, :dependent => :destroy

  def self.public_memoids
    where("public is NULL")
  end

  def self.private_memoids
    where("public = ?", false )
  end

  def self.collect_ripe_memoids
    ripe_memoids = []
    Memoid.all.each do |m| 
      ripe_memoids << m if m.ripe?
    end
    ripe_memoids
  end

  def self.run_notifier
    ripe_memoids = collect_ripe_memoids
    grouped_ripe_memoids = ripe_memoids.group_by { |m| m.user_id }
    grouped_ripe_memoids.each {|_,v| v.map!{ |m| m.id}}

    grouped_ripe_memoids.each do |user, memoids|
      _user = User.find user
      # binding.pry
      # binding.pry
      if (_user.delivery_time).past? then
        MailWorker.perform_async(user, memoids)
      else
        MailWorker.perform_at(user.delivery_time, user, memoids)
      end
    end
  end

  # Objective: A memoid is ripe if it is due today
  def ripe?
    a = []
    self.release_dates.each { |r| r.ping_date.today? && !r.released? ? a << r : a}
    delivered_release_dates = a.dup
    mark_for_destruction delivered_release_dates

    !a.empty?
  end

  def mark_for_destruction(delivered_release_dates)
    a = delivered_release_dates
    a.each { |r| r.update_attributes(:released => true)}
  end
end