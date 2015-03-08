class Dream < ActiveRecord::Base
    belongs_to :user
    has_many :dream_characters, :dependent => :destroy
    has_many :characters, through: :dream_characters
    accepts_nested_attributes_for :dream_characters
end
