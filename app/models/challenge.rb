class Challenge < ActiveRecord::Base
    has_one :badge, as: :achievable
    has_many :participants, dependent: :destroy
    has_many :users, through: :participants
end
