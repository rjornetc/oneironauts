class AddAttachmentIconToCharacters < ActiveRecord::Migration
  def self.up
    change_table :characters do |t|
      t.attachment :icon
    end
  end

  def self.down
    remove_attachment :characters, :icon
  end
end
