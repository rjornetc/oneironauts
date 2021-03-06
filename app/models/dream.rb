class Dream < ActiveRecord::Base
    belongs_to :user
    has_many :dream_characters, :dependent => :destroy
    has_many :characters, through: :dream_characters
    accepts_nested_attributes_for :dream_characters

    has_many :dream_locations, :dependent => :destroy
    has_many :locations, through: :dream_locations
    accepts_nested_attributes_for :dream_locations

    has_many :comments, :as => :commentable

    has_many :voters, :as => :votable
    has_many :users, through: :voters, :as => :votable

    has_many :dream_has_tags, :dependent => :destroy
    has_many :dream_tags, through: :dream_has_tags
    accepts_nested_attributes_for :dream_has_tags

    has_attached_file :icon, :styles => { :medium => "300x300>", :thumb => "100x100>" }, s3_permissions: :private,
                         s3_server_side_encryption: :aes256
    validates_attachment_content_type :icon, :content_type => /\Aimage\/.*\Z/
end
