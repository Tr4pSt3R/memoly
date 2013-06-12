require 'spec_helper'

describe Memoid do 
	before :each do
		@user = create :user
	end

	it "should read" do 
		without_access_control do 
			memoid = memoid :create
		end

		
	end
end