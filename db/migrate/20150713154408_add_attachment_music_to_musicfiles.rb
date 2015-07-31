class AddAttachmentMusicToMusicfiles < ActiveRecord::Migration
  def self.up
    change_table :music_files do |t|
      t.attachment :music
    end
  end

  def self.down
    remove_attachment :music_files, :music
  end
end
