class CreateDreamLocations < ActiveRecord::Migration
  def change
    create_table :dream_locations do |t|
      t.integer :dream_id
      t.integer :location_id

      t.timestamps null: false
    end
  end
end
