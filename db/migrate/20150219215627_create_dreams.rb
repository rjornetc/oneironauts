class CreateDreams < ActiveRecord::Migration
  def change
    create_table :dreams do |t|
      t.integer :user_id
      t.boolean :public
      t.text :content
      t.integer :votes
      t.text :interpretation
      t.string :tag1
      t.string :tag2

      t.timestamps null: false
    end
  end
end
