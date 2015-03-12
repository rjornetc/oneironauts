class AddAttachmentIconToLocations < ActiveRecord::Migration
  def self.up
    change_table :locations do |t|
      t.attachment :icon
    end
  end

  def self.down
    remove_attachment :locations, :icon
  end
end
