require 'spec_helper'

feature "Add Releasetime" do
  background do 
  	@user = FactoryGirl.create(:user)
  end

  scenario "When I add a new releasetime" do 
    # TODO Test::Feature 
    pending "Hack One-to-one assc. nesting. Initialised object is nil"
  	# sign_in
  	# within(".add_time") do 
   #    save_and_open_page
  	# 	fill_in "Time", :with => Time.now
  	# end
  	# click_on "Add Time"
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
