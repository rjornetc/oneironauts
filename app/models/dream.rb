class Dream < ActiveRecord::Base
    belongs_to :use
    has_many :dream_characters, :dependent => :destroy
    accepts_nested_attributes_for :dream_characters
end
