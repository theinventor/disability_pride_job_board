class AddFieldstoJob < ActiveRecord::Migration
  def self.up

    add_column :jobs, :skill_level, :string
    add_column :jobs, :location, :string
    add_column :jobs, :company, :string
    add_column :jobs, :pay_range, :integer
    add_column :jobs, :telecommute, :boolean
    add_column :jobs, :contract, :boolean
    add_column :jobs, :part_time, :boolean

  end

  def self.down
    remove_column :jobs, :skill_level, :location, :company, :pay_range, :telecommute, :contract, :part_time
  end
end
