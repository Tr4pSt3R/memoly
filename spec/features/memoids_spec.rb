require 'spec_helper'

feature "Add Memoid" do
    background do 
      @user = create :user
    end

    scenario "having not signed in" do 
      visit user_path(@user)
      
      page.should have_content "Sign in"
    end

    scenario "should be able to add memoid once I have signed in" do       
      sign_in
      within(".add_memoid") do
        # save_and_open_page
        fill_in "Note", :with => "$brew install automake"
      end
      click_on "Add memoid"

      page.should have_content("Your Memoid was successfully created")
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