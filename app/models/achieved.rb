class Achieved < ActiveRecord::Base
    belongs_to :achievement
    belongs_to :user
end
