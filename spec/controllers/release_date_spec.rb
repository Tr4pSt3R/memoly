require 'spec_helper'

describe "ReleaseDates" do 
	before :each do
		@user  = FactoryGirl.create(:user)
		memoid = FactoryGirl.create(:memoid)
		@user.memoids << memoid
	end

	context "create default dates after save" do 
		# memoid = @user.memoids.last
		# memoid.release_dates.should_not be_empty
	end
end