class WelcomeController < ApplicationController
  def index
    @subscriber = Subscriber.new    #put this here to work the form on home page? TODO: fix this :)
    @sub_count = Subscriber.all.count
  end

  def about
    @title = "About"
    @content = Content.find_by_page_name("about")        #our little CMS- get row with page name about

  end

  def contact
    @title = "Contact"
    @content = Content.find_by_page_name("contact")        #our little CMS- get row with page name contact

  end

  def faq
    @content = Content.find_by_page_name("faq")        #our little CMS- get row with page name faq
    @title = "F.A.Q."

  end

  def all_jobs
    @jobs = Job.not_expired.order('created_at DESC')
  end

  def unsubscribe
    user_id = Base64.decode64(params[:id])    #using base64 encoding in the url to prevent unsubscribe abuse
    @user = Subscriber.find(user_id)                #find the user from the ID in url
    @user.activated = false                     #change them to not get email
    @user.save                                #save the changes
  end

  def activate
    subscriber_id = Base64.decode64(params[:id])    #using base64 encoding in the url to prevent unsubscribe abuse
    @subscriber = Subscriber.find(subscriber_id)                #find the user from the ID in url
    @subscriber.activated = true                     #change them to not get email
    @subscriber.save                                #save the changes
  end

  def job_feed
    @jobs = Job.not_expired.order('created_at DESC')
    render :layout => false
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
  end

end
