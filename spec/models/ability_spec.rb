require 'spec_helper'
require 'cancan/matchers'

describe Ability do 
	before :each do
		@user = create :user
	end

	context "anonymous user" do
		user = @user
		ability = Ability.new(user)

		it { ability.can? :read, :all }
	end
end

