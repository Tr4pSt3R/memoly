require 'spec_helper'

feature "Add Memoid" do
    background do 
      @user = create :user
    end

    scenario "having not signed in" do 
      visit user_path(@user)
      save_and_open_page
      within(".add_memoid") do 
        fill_in(:note, "$git brew automake")
        check(:public, true)
      end
      click_on "Add memoid"

      page.should have_content "Failed"
    end

    # scenario "I add a memoid" do
    #   visit user_path(@user)
    #   save_and_open_page
    #   within(".add_memoid") do 
    #     fill_in(:note, "")
    #   end
    # end
end