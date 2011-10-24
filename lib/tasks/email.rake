desc "This task is for test-firing the email"
task :test_email => :environment do


  @subscribers_activated = Subscriber.where("id < ?", 12)   #test email to first 11 users
  @subscribers_activated.each do |s|
    JobSender.send_email(s).deliver
    puts "debug cron loop - at user: #{s.email}"
  end

end