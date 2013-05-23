require 'spec_helper'
require 'factory_girl_rails'
include Devise::TestHelpers

describe MemoidsController do
  before(:each) do
    @request.env["devise_mapping"] = Devise.mappings[:user]
    @user = create :user
  end

  # it "Disallow #create, if a user is not logged in" do
  #   sign_out @user
  #   @user.memoids << (build :memoid)
    
  #   assert !@user.save
  # end

  it "should authenticate user" do 
    pending "(before_filter authenticate_user!)"
  end

  # it "should be able to create memoid associated with a user" do
  #   sign_in @user
  #   @user.memoids << (build :memoid)
  #   @user.memoids.should_not be_empty
  # end

  # it "should not save memoid it has no user associated with it" do 
  #   @memoid = build :memoid
  #   assert !@memoid.save
  # end

  # it "" do 
  #   sign_in 
  # end
end
