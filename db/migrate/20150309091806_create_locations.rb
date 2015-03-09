class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.boolean :public

      t.timestamps null: false
    end
  end
end
