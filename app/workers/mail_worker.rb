class MailWorker
	include Sidekiq::Worker
	# sidekiq_options retry: false

	def perform_notification_delivery(memoid_id)
		for_memoid_id = memoid_id

		if mailout_time(for_memoid_id).past? then 
			perform for_memoid_id 
		else
			perform_at(mailout_time(for_memoid_id), memoid_id)
		end
	end

	def perform(memoid_id)
		memoid = Memoid.find_by_id memoid_id

		MemoidMailer.notification_email(memoid).deliver
	end

	def perform_at(mailout_time, memoid_id)
		memoid = Memoid.find_by_id memoid_id

		MemoidMailer.notification_email(memoid).deliver
	end

	def mailout_time(memoid_id)
		memoid = Memoid.find memoid_id

		ping_hour = memoid.user.releasetime.pingtime.hour
		ping_min = memoid.user.releasetime.pingtime.min
		t = Time.zone.now
		
		Time.zone.local(t.year, t.month, t.day, ping_hour, ping_min)
	end
end