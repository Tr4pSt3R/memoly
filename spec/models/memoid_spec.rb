require 'spec_helper'

describe Memoid do
	context "#Validations" do
		it { should validate_presence_of :user_id }
		it { should validate_presence_of :note }
	end
	
	describe "#Memoid associations" do
		it { should have_many(:release_dates) } 
		it { should belong_to(:user) }
	end

	context "on save" do
		it "workout default release dates" do
			user 	= create :user
			memoid 	= user.memoids.build( attributes_for :memoid )
			memoid.save!
			binding.pry 
			memoid.release_dates.should_not be_empty
		end
	end
end