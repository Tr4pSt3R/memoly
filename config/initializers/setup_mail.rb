ActionMailer::Base.smtp_settings = {
	:address 				=> "smtp.gmail.com",
	:port					=> 587, 
	:domain					=> "gmail.com",
	:user_name				=> "jones.k.agyemang",
	:password				=> "35riise95J",
	:authentication			=> "login",
	:enable_starttls_auto 	=> true
}