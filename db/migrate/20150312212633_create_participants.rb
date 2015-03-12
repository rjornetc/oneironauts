class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.integer :user_id
      t.integer :challenge_id
      t.boolean :done
      t.date :done_date
      t.integer :points

      t.timestamps null: false
    end
  end
end
