class MailWorker
	include Sidekiq::Worker
	# sidekiq_options retry: false

	def perform(user,memoids)
		MemoidMailer.notification_email(user, memoids).deliver
	end

	def perform_at(mailout_time_for, user, memoids)
		MemoidMailer.notification_email(user, memoids).deliver
	end
end