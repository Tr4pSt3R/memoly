require 'spec_helper'

describe User do 
	it "should read" do
		without_access_control do 
			user = user :create
		end
	end
end
