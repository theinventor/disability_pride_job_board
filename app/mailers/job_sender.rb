class JobSender < ActionMailer::Base
#this is where we need to make a loop to build the email to fire off to every user
  @jobs_for_email = Job.where("disabled != 'true' AND expiration > ?", Time.now)
  
  def send_email(user)
    puts "sending mail to #{user.email}"
    @this_user = user                           #making an object we can reach in the view
    mail( :to => user.email, :from =>  "jobs@disabilitypride.org" , :subject => 'disabilitypride.org Weekly Email')
    puts "Mail sent to #{user.email}"
  end
end

