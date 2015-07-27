class MusicFile < ActiveRecord::Base
  belongs_to :user
  has_attached_file :audio, styles: { mp3: {} },
  validates_attachment_content_type :audio, content_type:[ 'application/mp3', 'application/x-mp3', 'audio/mpeg', 'audio/mp3', 'image/jpeg']    
end
