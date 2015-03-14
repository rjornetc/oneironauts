class AddAttachmentIconToChallenges < ActiveRecord::Migration
  def self.up
    change_table :challenges do |t|
      t.attachment :icon
    end
  end

  def self.down
    remove_attachment :challenges, :icon
  end
end
