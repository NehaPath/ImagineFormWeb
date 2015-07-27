class AddUserIdToMusicFiles < ActiveRecord::Migration
  def change
    add_column :music_files, :user_id, :integer
    add_index :music_files, :user_id
  end
end
