class Subscriber < ActiveRecord::Base
  validates_uniqueness_of :email
end


# == Schema Information
#
# Table name: subscribers
#
#  id         :integer         primary key
#  name       :string(255)
#  email      :string(255)
#  activated  :boolean
#  created_at :timestamp
#  updated_at :timestamp
#

