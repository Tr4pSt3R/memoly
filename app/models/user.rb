class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :firstname, :lastname

  # A user can have many memoids through id
  has_many :memoids #not dependent: :destroy
  has_many :posts
  has_many :comments, :through => :posts  
  has_settings
  has_many :groups
  # alias :login_required
  

  def username
    firstname ||= "Jones"
    lastname ||= "Agyemang"
      return firstname+" "+lastname
  end


  # /home/jones/Memoly/.elasticbeanstalk/optionsettings.Memoly-env
end
