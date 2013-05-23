require 'spec_helper'

describe Releasetime do
	before(:each) do 
		@user = FactoryGirl.create(:user)
	end

	context "Associations" do
		it { should belong_to(:user) }
	end

	context "Create a release time for a user" do 
		it "add release time" do
			r = @user.build_releasetime(:pingtime => Time.now)
			assert r.save 
		end
	end
end

# time_now = Time.now.strftime("%H:%M")
# r = @user.build_releasetime(:pingtime => time_now)

# r.save
# binding.pry
# r.pingtime.strftime("%H:%M").should eq(time_now)