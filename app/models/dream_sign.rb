class DreamSign < ActiveRecord::Base
    belongs_to :user
    has_many :meanings
end
