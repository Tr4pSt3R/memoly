class MailWorker
	include Sidekiq::Worker
	# sidekiq_options retry: false

	def perform(user_id, memoid_ids)
		MemoidMailer.notification(user_id, memoid_ids).deliver
		# devops.com
	end

	def perform_at(mailout_time_for, user_id, memoid_ids)
		MemoidMailer.notification(user_id, memoid_ids).deliver
	end
end