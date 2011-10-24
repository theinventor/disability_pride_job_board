class AddPayRangetoJob < ActiveRecord::Migration
  def self.up
    add_column :jobs, :pay_estimate, :string

  end

  def self.down
    remove_column :jobs, :pay_estimate

  end
end
