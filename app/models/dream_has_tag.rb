class DreamHasTag < ActiveRecord::Base
  belongs_to :dream
  belongs_to :dream_tag
end
