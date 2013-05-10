class ApplicationController < ActionController::Base
  protect_from_forgery

  # def current_user
  # 	current_user ||= User.new unless current_user
  # end

  def after_sign_in_path_for(resource)
  	user_path(current_user)
  end
end
