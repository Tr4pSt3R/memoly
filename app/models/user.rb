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
  #Assocs 
  has_many :memoids #not dependent: :destroy
  has_many :posts
  has_many :comments, :through => :posts  
  has_many :groups
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
  

  # has_settings
    
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
