require 'spec_helper'

describe AlphaUser do
	it "should validate presence of email" do
		AlphaUser.validates :email, :presence => true 
	end

	it "should validate uniqueness of email" do
		AlphaUser.validates :email, :uniqueness => true
	end
end