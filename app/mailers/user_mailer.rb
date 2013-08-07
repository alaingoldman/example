class UserMailer < ActionMailer::Base
	def registration_confirmation(user)
		@user = user
		mail(:to => user.email, :subject => "Registered", :from => "alain@example.com")
	end
	def password_reset(user)
		@user = user
		mail(:to => user.email, :subject => "Password Reset", :from => 'alain@example.com')
	end

	def invitation(invitation)
		@invitation = invitation
		mail(:to => invitation.email, :subject => "You're invited", :from => 'alain@example.com')
	end

	def request_invitation(temporary_request)
		mail(:to => temporary_request.email, :subject => "Requested an invite", :from => 'alain@example.com')
	end

end
