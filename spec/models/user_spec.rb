require 'spec_helper'

describe User do
	describe "Associations" do 
		it { should have_one(:releasetime) }
		it { should have_many(:memoids) }
		it { should have_many(:assignments) }
		it { should have_many(:roles).through(:assignments) }
	end
end