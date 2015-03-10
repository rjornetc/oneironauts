class DreamTag < ActiveRecord::Base
  has_many :dream_has_tags, :dependent => :destroy
  has_many :dreams, through: :dream_has_tags
  accepts_nested_attributes_for :dream_has_tags
  belongs_to :user
end
