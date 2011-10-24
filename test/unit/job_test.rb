require 'test_helper'

class JobTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end









# == Schema Information
#
# Table name: jobs
#
#  id            :integer         primary key
#  title         :string(255)
#  details       :text
#  repost        :integer
#  user_id       :integer
#  created_at    :timestamp
#  updated_at    :timestamp
#  disabled      :boolean
#  expiration    :timestamp
#  skill_level   :string(255)
#  location      :string(255)
#  company       :string(255)
#  pay_range     :integer
#  telecommute   :boolean
#  contract      :boolean
#  part_time     :boolean
#  contact_name  :string(255)
#  contact_title :string(255)
#  contact_email :string(255)
#  contact_phone :string(255)
#  link          :string(255)
#  pay_estimate  :string(255)
#  equity        :boolean
#

