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
		it "should have the release dates worked out, by default" do
			pending "testing"
		end
	end
end