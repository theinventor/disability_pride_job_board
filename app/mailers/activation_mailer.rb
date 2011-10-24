class ActivationMailer < ActionMailer::Base
  default :from => "no-reply@disabilitypride.org"

  def welcome_email(user)
    @user = user
    @url  = "http://disabilitypride.heroku.com/activate/#{Base64.encode64(@user.id.to_s)}"
    mail(:to => user.email, :subject => "Welcome to disabilitypride.org - Please Verify")
  end

end
