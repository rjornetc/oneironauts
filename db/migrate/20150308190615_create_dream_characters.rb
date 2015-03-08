class CreateDreamCharacters < ActiveRecord::Migration
  def change
    create_table :dream_characters do |t|
      t.integer :dream_id
      t.integer :character_id

      t.timestamps null: false
    end
  end
end
