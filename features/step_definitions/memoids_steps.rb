Given /^I have memoids titled (.+)$/ do |titles|
	@user = FactoryGirl.create(:user)
	titles.split(', ').each do |title|
		@user.memoids << FactoryGirl.build(:memoid, title: title)
	end
end

When /^I am on the user profile page$/ do
	visit(users_path(@user))
end

Then /^I should to see "(.*?)"$/ do |title|
	page.should have_content title
end

And /^I should to see (.+)$/ do |text|
	page.has_content?(text)
end