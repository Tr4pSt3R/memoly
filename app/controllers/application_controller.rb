class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
  	current_user ||= User.new unless current_user
  end
end
