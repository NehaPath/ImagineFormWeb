class Musicfile < ActiveRecord::Base
	belongs_to :user

	has_attached_file :audio
					#:url  => "/assets/tracks/:account_id/:basename.:extension", 
    				#:path => ":rails_root/public/assets/tracks/:account_id/:basename.:extension" 

    #validate_attachment_presence :audio
    validates_attachment_content_type :audio, :content_type => [ 'application/mp3', 'application/x-mp3', 'audio/mpeg', 'audio/mp3', 'image/jpeg'] 
    
end
