require 'spec_helper'

describe Settings do 
	it "should have a default list of multiplier settings" do
		Settings.defaults[:multiplier].should_not be_empty
	end
end