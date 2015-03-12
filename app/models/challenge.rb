class Challenge < ActiveRecord::Base
    has_one :badge, as: :achievable
end
