class CreateMusicFiles < ActiveRecord::Migration
  def change
    create_table :music_files do |t|
      t.string :description
      t.timestamps null: false
    end
  end
end
