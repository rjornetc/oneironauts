class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :votes, default: 0
      t.integer :category_id
      t.timestamps null: false
    end
  end
end
