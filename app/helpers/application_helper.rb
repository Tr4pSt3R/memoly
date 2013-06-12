module ApplicationHelper
  def user_releasetimes_path(*args)
    user_releasetime_path(*args)
  end

  private
  	def after_sign_out_path_for(resource_or_scope)
  		home_path  		
  	end
end
