class Location < ActiveRecord::Base
    has_many :dream_locations, :dependent => :destroy
    has_many :dreams, through: :dream_locations
    belongs_to :user
end
