class CreateDreamHasTags < ActiveRecord::Migration
  def change
    create_table :dream_has_tags do |t|
      t.integer :dream_id
      t.integer :dream_tag_id

      t.timestamps null: false
    end
  end
end
