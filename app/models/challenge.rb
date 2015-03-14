class Challenge < ActiveRecord::Base
    has_many :participants, dependent: :destroy
    has_many :users, through: :participants
    
    has_attached_file :icon, :styles => { :medium => "300x300>", :thumb => "100x100>" }, s3_permissions: :private,
                         s3_server_side_encryption: :aes256
    validates_attachment_content_type :icon, :content_type => /\Aimage\/.*\Z/
end
