desc "this is some craigslist import goodness"
task :craigslist_seattle => :environment do
  require 'open-uri'

  url = "http://seattle.craigslist.org/search/jjj?query=disability+-insurance&srchType=A&format=rss"
  #url = "http://localhost:3000/clseattle.xml"   #for debugging/testing without hitting CL
  @doc = Nokogiri::XML(open(url))
  @doc.remove_namespaces!                   #make life a little easier, let us get date and such
  @doc.css("item").each do |item|
    @job = Job.new

    #ug - have duplicate titles - splitting at end of location
    #also have to check for () before doing the splits..
    if item.css("title").text.include?("(")
      @job.location = item.css("title").text.split(")")[1].split("(")[1]
      puts "LOC: #{@job.location}"
      @job.title = item.css("title").text.split(")")[0].split("(")[0]
    else
      @job.title = item.css("title").text
      @job.location = "None Given"
    end

    @job.details =  item.css("description").text

    @job.link = item.css("link").text

    if @job.title.include?("Sr.") then @job.skill_level = "Senior" end
    if @job.title.include?("Senior") then @job.skill_level = "Senior" end
    if @job.title.include?("Jr.") then @job.skill_level = "Junior" end
    if @job.title.include?("Junior") then @job.skill_level = "Junior" end

    #figure out if its a contract job
    #/contract/ =~ @job.details
    #if (/contract/ =~ @job.details) then
    #  puts "CONTRACT"
    #  @job.contract = true
    #else
    #  puts "NOT-CONTRACT"
    #end

    #figure out if its a telecommute
    #/contract/ =~ @job.details
    #if (/telecommuting/ =~ @job.details) then
    #  puts "TELECOMMUTE"
    #  @job.telecommute = true
    #else
    #  puts "NOT-TELECOMMUTE"
    #end
    #
    ##figure out if its part-time
    ##/contract/ =~ @job.details
    #if (/partTime/ =~ @job.details) then
    #  puts "PART-TIME"
    #  @job.part_time = true
    #else
    #  puts "NOT-PART-TIME"
    #end

    #some default values that we aren't parsing for yet
    @job.contact_email = "NA@SeeDescription.com"
    @job.contact_name = "From Craigslist"
    @job.company = "From Craigslist"
    @job.user_id = 3
    @job.expiration = Time.now + 1.month


    #some debugging
    puts "Title: #{@job.title}"
    #puts "Details: #{@job.details}"
    puts "Email: #{@job.contact_email}"

    #only save if a field is unique - so we don't get duplicates - using email field at the moment
    unless Job.exists?(:link=>@job.link)
      puts "SAVINGNOW"
      @job.save!
    end


  end

end
