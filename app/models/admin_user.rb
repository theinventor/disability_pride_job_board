class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
end


# == Schema Information
#
# Table name: admin_users
#
#  id                     :integer         primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(128)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :timestamp
#  remember_created_at    :timestamp
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :timestamp
#  last_sign_in_at        :timestamp
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :timestamp
#  updated_at             :timestamp
#

