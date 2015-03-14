class CreateAchieveds < ActiveRecord::Migration
  def change
    create_table :achieveds do |t|
      t.integer :user_id
      t.integer :achievement_id

      t.timestamps null: false
    end
  end
end
