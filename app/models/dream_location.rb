class DreamLocation < ActiveRecord::Base
    belongs_to :dream
    belongs_to :location
end
