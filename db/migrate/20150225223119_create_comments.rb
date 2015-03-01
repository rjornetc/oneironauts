class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.text :content
      t.integer :votes, default: 0
      t.integer :commentable_id
      t.string  :commentable_type
      t.boolean :spam?

      t.timestamps null: false
    end
  end
end
