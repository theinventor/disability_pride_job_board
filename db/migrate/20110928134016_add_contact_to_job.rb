class AddContactToJob < ActiveRecord::Migration
  def self.up
    add_column :jobs, :contact_name, :string
    add_column :jobs, :contact_title, :string
    add_column :jobs, :contact_email, :string
    add_column :jobs, :contact_phone, :string
  end

  def self.down
    remove_column :jobs, :contact_title
    remove_column :jobs, :contact_name
    remove_column :jobs, :contact_email
    remove_column :jobs, :contact_phone
  end
end
