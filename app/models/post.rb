class Post < ActiveRecord::Base
    belongs_to :category

    has_many :comments, :as => :commentable

    belongs_to :user
    has_many :voters, :as => :votable
    has_many :users, through: :voters, :as => :votable
end
