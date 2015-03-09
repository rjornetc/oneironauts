class CreateDreams < ActiveRecord::Migration
  def change
    create_table :dreams do |t|
      t.integer :user_id
      t.boolean :public
      t.text :content
      t.integer :votes, default: 0

      t.timestamps null: false
    end
  end
end
