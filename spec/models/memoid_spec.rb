require 'spec_helper'

describe Memoid do
	describe "#Memoid associations" do 
		it { should belong_to(:user) }
		it { should have_many(:releasedates) }
	end

	# before(:each) do
	# 	@m = Memoid.create(:note => "Release of Memoid hounds is not illgal")
	# end
end