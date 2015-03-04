class Meaning < ActiveRecord::Base
    belongs_to :user
    belongs_to :dream_sign
    
    has_many :voters, :as => :votable
    has_many :users, through: :voters, :as => :votable
end
