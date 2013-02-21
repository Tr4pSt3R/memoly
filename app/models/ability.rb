class Ability
  include CanCan::Ability

  def initialize(user)
    # alias_action :show => :view
    # user ||= User.new # guest user (not logged in)
    # if user
    #     can [:create], AlphaUser
    #     can [:show], AlphaUser
    # end
  end
end
