class AddEquityToJobs < ActiveRecord::Migration
  def self.up
    add_column :jobs, :equity, :boolean
  end

  def self.down
    remove_column :jobs, :equity
  end
end
