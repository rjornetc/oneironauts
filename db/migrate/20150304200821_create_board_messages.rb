class CreateBoardMessages < ActiveRecord::Migration
  def change
    create_table :board_messages do |t|
      t.text :content
      t.integer :user_id
      t.integer :group_id
      t.boolean :sticky

      t.timestamps null: false
    end
  end
end
