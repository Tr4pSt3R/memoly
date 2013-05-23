require 'spec_helper'

feature "Add Releasetime" do
  background do 
  	@user = FactoryGirl.create(:user)
  end

  scenario "When I add a new releasetime" do 
  	sign_in
  	visit user_path(@user)
	  	within(".add-time") do 
	  		fill_in "Time", :with => Time.now
	  	end
  	click_on "Add Time"
  end 	

  private 
      def sign_in 
        visit new_user_session_path
          within(".session") do 
            fill_in "Email",  :with => @user.email
            fill_in "Password", :with => "testtest"
          end
        click_on "Sign in"
      end
end
