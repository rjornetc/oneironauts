class CreateDreamTags < ActiveRecord::Migration
  def change
    create_table :dream_tags do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
