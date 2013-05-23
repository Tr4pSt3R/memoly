class Memoid < ActiveRecord::Base 
  attr_accessible :title, :note, :public

  # Validations
  validates :note, :presence => true
  validates :user_id, :presence => true
  
  #Associations
  belongs_to :user
  has_many :release_dates

  def public?
    self.public
  end

  private
    def calculate_default_release_dates(memoid)
      default_dates = ReleaseDate::DEFAULT_DATES.dup
      default_dates.map! { |x| memoid.created_at + x.days}
      default_dates.map {|date| ReleaseDate.create!(:ping_date => date, :memoid_id => memoid.id)}     
    end
end
