class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  using_access_control
  devise  :database_authenticatable, 
          :registerable,
          :recoverable, 
          :rememberable, 
          :trackable, 
          :validatable
  
  #Associations 
  has_many :memoids, :after_add => :set_memoid_defaults
  has_many :posts
  has_many :comments, :through => :posts  
  has_many :groups
  has_many :assignments
  has_many :roles, :through => :assignments
  has_one  :releasetime
  
  # nested attrs
  accepts_nested_attributes_for :releasetime, :memoids
  
  # Mass-assignables
  attr_accessible :firstname, 
                  :lastname,
                  :email, 
                  :password, 
                  :password_confirmation, 
                  :remember_me, 
                  :releasetime_attributes, 
                  :memoids_attributes


  def after_initialize
    self.releasetime ||= self.build_releasetime()    
  end

  def role_symbols
    (roles || []).map { |r| r.name.to_sym }    
  end

  def make_admin
    self.roles.create(:admin)
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
