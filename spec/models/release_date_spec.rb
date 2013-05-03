require 'spec_helper'

describe ReleaseDate do
	describe "#ReleaseDate Associations" do 
		it { should belong_to(:memoid) }
	end

	context "calculate release dates" do 
		it "should have default date constants" do 
			r_dates = ReleaseDate::DEFAULT_DATES
			assert_equal r_dates, %w(1 7 30 90 180)
		end
	end
end
