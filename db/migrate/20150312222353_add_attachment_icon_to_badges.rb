class AddAttachmentIconToBadges < ActiveRecord::Migration
  def self.up
    change_table :badges do |t|
      t.attachment :icon
    end
  end

  def self.down
    remove_attachment :badges, :icon
  end
end
