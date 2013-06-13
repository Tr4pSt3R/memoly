class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_current_user

  helper %w(users)

  def after_sign_in_path_for(resource)
  	user_path(current_user)
  end

  def permission_denied
    flash[:notice] = "Sorry, you are not allowed to access that page"
    redirect_to root_url
  end

  protected
  	def set_current_user
  		Authorization.current_user = current_user  	
  	end
end