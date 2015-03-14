class Participant < ActiveRecord::Base
    belongs_to :challenge
    belongs_to :user
end
