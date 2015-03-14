class AddAttachmentIconToAchievements < ActiveRecord::Migration
  def self.up
    change_table :achievements do |t|
      t.attachment :icon
    end
  end

  def self.down
    remove_attachment :achievements, :icon
  end
end
