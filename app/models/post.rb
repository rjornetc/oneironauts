class Post < ActiveRecord::Base
    has_many :post_categories
    has_many :categories, through: :post_categories
    accepts_nested_attributes_for :post_categories, :allow_destroy => true
    
    has_many :comments, :as => :commentable
    
    belongs_to :user
    has_many :voters, :as => :votable
    has_many :users, through: :voters, :as => :votable
end 
