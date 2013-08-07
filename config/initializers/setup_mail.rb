ActionMailer::Base.smtp_settings = {
	:address => "smtp.gmail.com",
	:port => 587,
	:domain => "soofly.com",
	:user_name => "alain@example.com",
	:password => "private",
	:authentication => "plain",
	:enable_starttls_auto => true
}