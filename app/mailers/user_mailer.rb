class UserMailer < ActionMailer::Base
  default :from => "jones.k.agyemang@gmail.com"

  # def welcome_email(user)
  #    @user = user
  #    @url = "http://Memoly-env-8zua3wnryt.elasticbeanstalk.com/users/sign_in"
  #    mail(:to => user.email, :subject => "Welcome To MemolyApp")
  # end

  def welcome_email(email)
     # @user = user
     @url = "http://Memoly-env-8zua3wnryt.elasticbeanstalk.com/users/sign_in"
     mail(:to => email, :subject => "Welcome To MemolyApp")
  end
end
