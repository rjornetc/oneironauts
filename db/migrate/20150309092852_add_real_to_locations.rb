class AddRealToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :real, :boolean
  end
end
