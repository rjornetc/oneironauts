class Dream < ActiveRecord::Base
    belongs_to :user
    has_many :dream_characters, :dependent => :destroy
    has_many :characters, through: :dream_characters
    accepts_nested_attributes_for :dream_characters
    
    has_many :dream_locations, :dependent => :destroy
    has_many :locations, through: :dream_locations
    accepts_nested_attributes_for :dream_locations
end
