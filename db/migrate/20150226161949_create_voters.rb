class CreateVoters < ActiveRecord::Migration
  def change
    create_table :voters do |t|
      t.integer :user_id
      t.integer :votable_id
      t.string  :votable_type

      t.timestamps null: false
    end
  end
end