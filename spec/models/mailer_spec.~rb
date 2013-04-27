require 'spec_helper'

describe UserMailer do
	context "memoid release due" do
		it "schedule message delivery in an hour" do
			assert fail
		end
	end

	it "should be able to deliver messages" do
		email = "mightyj@hotmail.co.uk"
		MemoidMailer.transport(email).deliver
		ActionMailer::Base.deliveries.should_not be_empty
	end

	it "should be able to deliver messages an hour later" do
		assert fails
	end
end
