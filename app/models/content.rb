class Content < ActiveRecord::Base

  validates_presence_of :body, :title, :page_name
  validates_uniqueness_of :page_name

end


# == Schema Information
#
# Table name: contents
#
#  id         :integer         primary key
#  page_name  :string(255)
#  title      :string(255)
#  body       :text
#  created_at :timestamp
#  updated_at :timestamp
#

