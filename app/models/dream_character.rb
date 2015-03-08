class DreamCharacter < ActiveRecord::Base

    belongs_to :dream
    belongs_to :character

end
