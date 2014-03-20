class AppMailer < ActionMailer::Base
	helper ApplicationHelper

	def send_registration_email(student)
		@student = student
		mail to: student.email, from: "registration@sevenhillsskydivers.org", subject: "You've Registered for a Skydive!"
	end
end