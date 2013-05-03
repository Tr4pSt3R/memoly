require 'spec_helper'

describe UsersController do
	# before(:all) do
	# 	@request.env["devise_mappings"] = Devise.mappings[:user]
	# 	get :new
	# end

	before(:each) do
	    @user = FactoryGirl.create(:user)
	end

	it "should be able to sign in" do
		sign_in @user
	end

	it "should be able to sign out" do
		sign_out @user
	end

	describe "GET 'show'" do 
		it "should be successful" do 
			get :show, :id => @user.id
			response.should be_success
		end

		it "should show the right user" do 
			assigns(:user).should == @user
		end
	end
end