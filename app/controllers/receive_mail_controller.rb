class ReceiveMailController < ApplicationController
  def receive
    job = Job.create({
      :title => params[:subject], 
      :details => params[:text], 
      :user_id => 3,
      :disabled => true,
      :expiration => 3.months.from_now,
    })
    if job
      head :ok
    else
      head 500
    end
  end

end
