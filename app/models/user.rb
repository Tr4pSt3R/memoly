class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise  :database_authenticatable, 
          :registerable,
          :recoverable, 
          :rememberable, 
          :trackable, 
          :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :firstname, :lastname
  attr_accessible :release_time
  # has_settings do |s|
  #   s.key :release_time, :defaults => { :time => '00:00'}
  # end

  # A user can have many memoids through id
  has_many :memoids #not dependent: :destroy
  has_many :posts
  has_many :comments, :through => :posts  
  has_many :groups
  # alias :login_required
  has_settings
  has_one :releasetime
  
  
  def role?(role)
    return !!roles.find_by_name(role.to_s)
  end

  def make_admin
    roles << Role.admin
  end

  def revoke_admin
    roles.delete(Role.admin) if roles.include?(Role.admin)
  end

  def admin?
    role?(:admin)
  end

  def username
    firstname ||= "Don"
    lastname ||= "Quioxte"
      return firstname+" "+lastname
  end

  private
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
