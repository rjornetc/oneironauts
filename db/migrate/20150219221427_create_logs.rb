class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :user_id
      t.integer :points
      t.text :description
      t.boolean :notificable
      t.integer :owner_id

      t.timestamps null: false
    end
  end
end
