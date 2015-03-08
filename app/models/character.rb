class Character < ActiveRecord::Base
    has_many :dream_characters
    belongs_to :user
end
