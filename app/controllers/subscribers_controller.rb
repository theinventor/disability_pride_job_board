class SubscribersController < ApplicationController



  def create
    @subscriber = Subscriber.new(params[:subscriber])
    respond_to do |format|
      if @subscriber.save
        ActivationMailer.welcome_email(@subscriber).deliver            #fire the activation email
        format.html { redirect_to("/", :notice => 'Thank you. Now you just need to confirm your subscription using the activation email we just sent to you.') }
        format.xml  { render :xml => "/", :status => :created, :location => @subscriber }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @subscriber.errors, :status => :unprocessable_entity }
      end
    end
  end


end

