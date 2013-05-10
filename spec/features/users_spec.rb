require 'spec_helper'

feature "Signing up" do 
	background do 
		@user = FactoryGirl.create(:user, :email => "devise@gitmail.com")
	end

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

	scenario "Signing in with correct credentials" do
		visit '/users/sign_in'
		within(".session") do 
			fill_in "Email", 	:with => "devise@gitmail.com"
			fill_in "Password", :with => "testtest"
		end

		click_on "Sign in"
		page.should have_content "Signed in successfully." #change returned msg in devise/i8n
	end
end