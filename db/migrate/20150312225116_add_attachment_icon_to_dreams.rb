class AddAttachmentIconToDreams < ActiveRecord::Migration
  def self.up
    change_table :dreams do |t|
      t.attachment :icon
    end
  end

  def self.down
    remove_attachment :dreams, :icon
  end
end
