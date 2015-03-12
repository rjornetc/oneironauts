class Achievement < ActiveRecord::Base
  has_one :badge, as: :achievable
  has_many :achieved, dependent: :destroy
  has_many :users, through: :achieved
end
