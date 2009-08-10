class CreateTweets < ActiveRecord::Migration
  def self.up
    create_table :tweets do |t|
      t.string   :text
      t.integer  :contact_id
      t.datetime :created_at
      t.datetime :updated_at
    end
    
    add_column :contacts, :image_updated_at, :datetime
    change_column :contacts, :image_file_size, :integer, :limit => nil
  end

  def self.down
    remove_column :contacts, :image_updated_at
    change_column :contacts, :image_file_size, :string
    
    drop_table :tweets
  end
end
