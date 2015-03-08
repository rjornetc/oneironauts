class Character < ActiveRecord::Base
    has_many :dream_characters, :dependent => :destroy
    has_many :dreams, through: :dream_characters
    belongs_to :user
end
