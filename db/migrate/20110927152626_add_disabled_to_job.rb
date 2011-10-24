class AddDisabledToJob < ActiveRecord::Migration
  def self.up
    add_column :jobs, :disabled, :boolean
  end

  def self.down
    remove_column :jobs, :disabled
  end
end
