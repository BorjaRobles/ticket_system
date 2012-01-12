class AddAttachmentFotoToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :foto_file_name, :string
    add_column :users, :foto_content_type, :string
    add_column :users, :foto_file_size, :integer
    add_column :users, :foto_updated_at, :datetime
  end

  def self.down
    remove_column :users, :foto_file_name
    remove_column :users, :foto_content_type
    remove_column :users, :foto_file_size
    remove_column :users, :foto_updated_at
  end
end
