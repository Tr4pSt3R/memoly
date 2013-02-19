require 'spec_helper'

describe UsersController do
	# before(:all) do
	# 	@request.env["devise_mappings"] = Devise.mappings[:user]
	# 	get :new
	# end

	before(:each) do
	    @user = User.create(:firstname => "Jones", :email => "mightyj@hotmail.co.uk")
	end

	it "should be able to sign in" do
		# sign_in @user
	end

	it "should be able to sign out" do
		sign_out @user
	end
end