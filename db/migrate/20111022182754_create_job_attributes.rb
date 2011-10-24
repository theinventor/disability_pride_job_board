class CreateJobAttributes < ActiveRecord::Migration
  def self.up
    create_table :job_attributes do |t|
      t.string :name
    end
    
    create_table :job_attributes_jobs, :id => false do |t|
      t.integer :job_attribute_id, :null => false
      t.integer :job_id, :null => false
    end
    
    add_index :job_attributes_jobs, [:job_attribute_id, :job_id], :unique => true
    
    remove_column :jobs, :telecommute
    remove_column :jobs, :contract
    remove_column :jobs, :part_time
    remove_column :jobs, :equity
    
    JobAttribute.create(:name => 'Telecommute')
    JobAttribute.create(:name => 'Contract')
    JobAttribute.create(:name => 'Part Time')
    JobAttribute.create(:name => 'Full Time')
  end

  def self.down
    drop_table :job_attributes
  end
end
