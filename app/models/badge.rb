class Badge < ActiveRecord::Base
    belongs_to :achievable, polymorphic: true

    has_attached_file :icon, :styles => { :medium => "300x300>", :thumb => "100x100>" }
    validates_attachment_content_type :icon, :content_type => /\Aimage\/.*\Z/
end
