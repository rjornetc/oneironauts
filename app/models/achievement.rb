class Achievement < ActiveRecord::Base
  has_one :badge, as: :achievable
end
