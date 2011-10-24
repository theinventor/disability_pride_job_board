class AddExpirationToJob < ActiveRecord::Migration
  def self.up
    add_column :jobs, :expiration, :timestamp
  end

  def self.down
    remove_column :jobs, :expiration
  end
end
