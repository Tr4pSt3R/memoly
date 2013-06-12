require 'spec_helper'

describe MemoidMailer do
	context "#transport" do
		it "should be able to deliver messages" do
			email = "mightyj@hotmail.co.uk"
			MemoidMailer.transport(email).deliver
			ActionMailer::Base.deliveries.should_not be_empty
		end
	end

	context "send #notification_email" do 
		it "should be able to deliver the notification email" do
			pending 'MemoidMailer.notification_email()'
		end
	end
end