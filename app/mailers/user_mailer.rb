class UserMailer < ActionMailer::Base
  default from: "jones.k.agyemang@gmail.com"

  def welcome_email(user)
     @user = user
     @url = "http://localhost:3000/users/sign_in"
     mail(to: user.email, subject: "Welcome To MemolyApp")
  end
end
