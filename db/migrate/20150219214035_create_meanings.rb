class CreateMeanings < ActiveRecord::Migration
  def change
    create_table :meanings do |t|
      t.integer :user_id
      t.string :description
      t.integer :votes
      t.boolean :spam

      t.timestamps null: false
    end
  end
end
