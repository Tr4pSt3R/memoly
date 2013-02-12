require 'spec_helper'

describe Memoid do
	it "should be aware of its dueness" do
		m = Memoid.create(:note => "This is a test of mettle")
		m.due_in_next_hour?.should be_true
	end

end