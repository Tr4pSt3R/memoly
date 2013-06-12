require 'spec_helper'

feature "Sessions" do 
	background do
		without_access_control do
			@user = FactoryGirl.create(:user, :email => "devise@gitmail.com")
			User.find(:first).roles.create(:name => 'admin')
		end
	end

	scenario "Signing in with correct credentials" do
		visit '/users/sign_in'
		within(".session") do 
			fill_in "Email", 	:with => "devise@gitmail.com"
			fill_in "Password", :with => "testtest"
		end

		Authorization.current_user = @user
		click_on "Sign in"
		page.should have_content "Signed in successfully." #change returned msg in devise/i8n
	end

	scenario "Sign in with incorrect email address" do
		visit '/users/sign_in'
		within(".session") do 
			fill_in "Email", 	:with => "faked@gitmail.com"
			fill_in "Password", :with => "testtest"
		end

		click_on "Sign in"
		page.should have_content "Invalid email or password" #change returned msg in devise/i8n
	end

	scenario "Sign in with incorrect password" do
		visit '/users/sign_in'
		within(".session") do 
			fill_in "Email", 	:with => "devise@gitmail.com"
			fill_in "Password", :with => "untrue_password"
		end


		click_on "Sign in"
		page.should have_content "Invalid email or password" #change returned msg in devise/i8n
	end
end

feature "Registeration" do 
	scenario "Signing up" do 
		visit '/users/sign_up'
		within(".register") do
			fill_in "Email",	:with => Faker::Internet.email
			fill_in "Password",	:with => "seekreet"
			fill_in "Password confirmation", :with => "seekreet"
		end
		click_on "Sign up"
		# save_and_open_page
		page.should have_content "Welcome! You have signed up successfully."
	end
end