class Meaning < ActiveRecord::Base
    belongs_to :user
    belongs_to :dream_sign
end
