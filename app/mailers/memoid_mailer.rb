class MemoidMailer < ActionMailer::Base
  default :from => "jones.k.agyemang@gmail.com"

  # def transport(email)
  #    # @user = user
  #    @url = "http://Memoly-env-8zua3wnryt.elasticbeanstalk.com/users/sign_in"
  #    mail(	 :to => email, 
  #    		     :subject => "New Memoly for #{Time.current}")
  # end

  def notification(user, memoids)
  	@user    = User.find_by_id user
    @memoids = Memoid.find memoids 
    @url = "http://www.memolyapp.com/"
    mail(:to => @user.email , :subject => "Memoly::Today")
  end
end
