class AddEmailtoUser < ActiveRecord::Migration
  def self.up
    add_column :users, :no_email, :boolean
  end

  def self.down
    remove_column :users, :no_email, :boolean

  end
end
