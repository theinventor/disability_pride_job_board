module ApplicationHelper

  def logo
    image_tag("logo.png", :alt => "Seattle Ruby Jobs")
  end
  
  def logo_beta
     image_tag("logo-beta.png", :alt => "Seattle Ruby Jobs in Beta")
   end


  def title
    base_title = "Seattle Ruby Jobs"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def senddate
    t.Time.now
    t.strftime("Sent %B %d %Y")
  end

end
