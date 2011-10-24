class AddLinkToJob < ActiveRecord::Migration
  def self.up
    add_column :jobs, :link, :string
  end

  def self.down
    remove_column :jobs, :link
  end
end
