class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.text :description
      t.boolean :real
      t.boolean :public
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
