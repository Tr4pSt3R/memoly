require 'spec_helper'

describe Memoid do
	before(:each) do
		@m = Memoid.create(:note => "Release of Memoid hounds are not illgeal")
	end

	# if i create a memoid and schedule a delivery within the next hour
	# it should be due in the next hour
	context "new created and has scheduled a release within the next hour" do
		it  "should be viable for release" do
			@m.settings['multiplier'] = [1.hour]
			@m.due_in_next_hour?.should be_true
		end
	end

end