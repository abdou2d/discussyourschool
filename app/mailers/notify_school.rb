class NotifySchool < ActionMailer::Base

    default from: 'no-reply@discussyourschool.com'

	def send_notification_to_school(email_school)
		mail({
			:to => email_school,
			:bcc => ['Notify school <contato@discussyourschool.com'],
			:subject => I18n.t('email.notify_school.subject')
		})
	end

end
