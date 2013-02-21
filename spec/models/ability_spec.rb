require 'spec_helper'
require 'cancan/matchers'

describe Ability do
	describe "abilities" do
	subject{ ability }
	let(:user){ nil }
	let(:ability){ Ability.new(user)}

		context "when user has no abilities/anonymous" do
			let(:user){User.new}
			it { should_not be_able_to(:destroy, AlphaUser)}
			it { should_not be_able_to(:read, AlphaUser) }
			it { should be_able_to(:create, AlphaUser)}
			it { should be_able_to(:show, AlphaUser)}
		end
	end
end