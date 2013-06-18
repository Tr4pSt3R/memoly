require 'spec_helper'
require 'factory_girl_rails'
include Devise::TestHelpers

describe MemoidsController do
  before(:each) do
    @request.env["devise_mapping"] = Devise.mappings[:user]
    @user = create :user
  end
end
