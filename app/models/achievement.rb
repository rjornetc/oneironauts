class Achievement < ActiveRecord::Base
  has_many :achieved, dependent: :destroy
  has_many :users, through: :achieved
  
  has_attached_file :icon, :styles => { :medium => "300x300>", :thumb => "100x100>" },
                       s3_server_side_encryption: :aes256
  validates_attachment_content_type :icon, :content_type => /\Aimage\/.*\Z/
end
