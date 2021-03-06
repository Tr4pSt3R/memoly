class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  # before_filter :set_current_authorized_user

  def set_current_authorized_user
    Authorization.current_user = current_user
  end
  
  devise  :database_authenticatable, 
          :registerable,
          :recoverable, 
          :rememberable, 
          :trackable, 
          :validatable
  
  #Associations 
  has_many :memoids, :after_add => [:set_memoid_defaults, :set_topic]
  has_many :posts
  has_many :comments, :through => :posts  
  has_many :groups
  has_many :assignments
  has_many :roles, :through => :assignments
  has_one  :releasetime
  
  # nested attrs
  accepts_nested_attributes_for :releasetime, :memoids, :posts
  
  # Mass-assignables
  attr_accessible :firstname, 
                  :lastname,
                  :email, 
                  :password, 
                  :password_confirmation, 
                  :remember_me, 
                  :releasetime_attributes, 
                  :memoids_attributes, 
                  :posts_attributes

  def after_initialize
    self.releasetime ||= self.build_releasetime(:pingtime => "2000-01-01 08:00:00")    
  end

  def role_symbols
    (roles || []).map { |r| r.name.to_sym }    
  end

  def make_admin
    self.roles.create(:name => "admin")
  end

  def delivery_time
    if self.releasetime then
      ping_hour   = self.releasetime.pingtime.hour
      ping_min    = self.releasetime.pingtime.min
      t = Time.zone.now
      Time.zone.local(t.year, t.month, t.day, ping_hour, ping_min)
    end
  end
  
  # def role?(role)
  #   return !!roles.find_by_name(role.to_s)
  # end

  # def make_admin
  #   roles << Role.admin
  # end

  # def revoke_admin
  #   roles.delete(Role.admin) if roles.include?(Role.admin)
  # end

  # def admin?
  #   role?(:admin)
  # end

  def username
    self.firstname ||= "Don"
    self.lastname ||= "Quioxte"
      return firstname+" "+lastname
  end

  private
    def set_topic(memoid)
      memoid.note = "" if memoid.note.nil?
      memoid.note.each_line(' ') do |s|
        if s.include? '#' then
          _,_,topic_name = s.partition '#'
          topic_name = topic_name.rstrip.titleize
          binding.pry
          # topic_name = Sanitize.clean(topic_name)
          t = Topic.where(:name => topic_name).first_or_create
          t.memoids << memoid
        end
      end
    end

    def set_memoid_defaults(memoid)
      default_dates = ReleaseDate::DEFAULT_DATES.dup

      default_dates.each do |i|
        memoid.release_dates.build(:ping_date => Time.zone.now + i.days)
      end
    end

    def self.settings_attr_accessors(*args)
      args.each do |method_name|
        eval "
          def #{method_name}
            self.settings.send(:#{method_name})
          end
          def #{method_name}=(value)
            self.settings.send(:#{method_name}=, value)
          end
        "
      end
    end

    settings_attr_accessors :release_time
  # /home/jones/Memoly/.elasticbeanstalk/optionsettings.Memoly-env
end
