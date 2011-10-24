desc "This task is called by the Heroku cron add-on"
task :cron => :environment do

  #go get the new stuff from CL
  Rake::Task["craigslist_seattle"].execute


  if Time.now.monday?   #daily cron, looks for Monday to run
    puts "Send the email to all users.."
    #not going to email the users, just subscribers
    #@users_for_email = User.where("no_email != ?", true)   #get everyone that hasn't come off the list
    #@users_for_email.each do |m|
    #  JobSender.send_email(m).deliver
    #  puts "debug cron loop - at user: #{m.email}"
    #end
    @subscribers_activated = Subscriber.where("activated = ?", true)   #get activated subscribers too
    @subscribers_activated.each do |s|
      JobSender.send_email(s).deliver
      puts "debug cron loop - at user: #{s.email}"
    end
    puts "done."
  else
    puts "not running today"

  end

end