require 'spec_helper'

describe Memoid do
	before :each do
		@user 	= create :user
		@user.create_releasetime(:pingtime => Time.zone.local(2000,1,1,8))
	end

	context "#Validations" do
		it { should validate_presence_of :user_id }
		it { should validate_presence_of :note }
	end
	
	describe "#Memoid associations" do
		it { should have_many(:release_dates) } 
		it { should belong_to(:user) }
		it { should belong_to(:topic) }
	end

	context "Ping at release time" do
	end

	context "destroy dependency #release_dates" do 
		let(:memoid) { @user.memoids.create( attributes_for :memoid ) }
		it "should destroy release_dates when memoid is destroyed" do 
			memoid.save!

			all_release_dates = memoid.release_dates
			assert !all_release_dates.empty?

			memoid.destroy
			memoid.save!

			query_result = ReleaseDate.find all_release_dates.map{ |k| k.id}

			query_result.should be_empty
		end
	end

	context "on create" do
		let(:memoid) { @user.memoids.create( attributes_for :memoid ) }

		it "workout default release dates" do
			memoid.release_dates.should_not be_empty
		end

		it "should calculate correct default dates" do
			t = Time.now
			default_dates = ReleaseDate::DEFAULT_DATES
			a = []
			default_dates.each do |i|
				a << ReleaseDate.create(:ping_date => t + i.days)
			end

			# convert to date to avoid minute difference 
			# to avoid causing the tests to fail as we don't care about micro-second delays
			a.map! { |x|  x.ping_date.to_date}
			b = memoid.release_dates
			b = b.map { |x|  x.ping_date.to_date}
			b.should eq(a)
		end
	end

	context "when ripe" do 		
		let(:memoid) { @user.memoids.create!( attributes_for :memoid ) }

		it "should #collect ripe memoids" do 
			memoid.release_dates.create(:ping_date => Time.zone.now)
			ripe_memoids = Memoid.collect_ripe_memoids
			ripe_memoids.should_not be_empty
		end

		it "should #collect memoids due tomorrow" do 
			memoid.save!
			assert_empty Memoid.collect_ripe_memoids

			Timecop.travel(1.day) do 
				ripe_memoids = Memoid.collect_ripe_memoids
				ripe_memoids.should_not be_empty
			end
		end

		it "should #collect memoids due next week" do 
			memoid.save!

			assert_empty Memoid.collect_ripe_memoids
			Timecop.travel(1.week) do 
				ripe_memoids = Memoid.collect_ripe_memoids
				ripe_memoids.should_not be_empty
			end
		end

		it "should #collect memoids due next month" do 
			memoid.save!

			assert_empty Memoid.collect_ripe_memoids
			Timecop.travel(30.days) do 
				ripe_memoids = Memoid.collect_ripe_memoids
				ripe_memoids.should_not be_empty
			end
		end

		it "should #collect memoids due in 3 months" do 
			memoid.save!

			assert_empty Memoid.collect_ripe_memoids
			Timecop.travel(90.days) do 
				ripe_memoids = Memoid.collect_ripe_memoids
				ripe_memoids.should_not be_empty
			end
		end

		it "should #collect memoids due in 6 months" do 
			memoid.save!

			assert_empty Memoid.collect_ripe_memoids
			Timecop.travel(180.days) do 
				ripe_memoids = Memoid.collect_ripe_memoids
				ripe_memoids.should_not be_empty
			end
		end

		it "should send #notification for Memoids due tomorrow" do 
			memoid.save!

			Timecop.travel(1.day) do 
				Memoid.run_notifier
				expect {
  					MailWorker.perform_async(@user.id, [memoid.id])}.to change(MailWorker.jobs, :size).by(1)
  					
				# ActionMailer::Base.deliveries.should_not be_empty
			end
		end

		it "clear past release dates" do
			memoid.save!

			Timecop.travel(1.day) do 

			end
			pending
		end
	end
end