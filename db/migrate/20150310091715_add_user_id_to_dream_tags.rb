class AddUserIdToDreamTags < ActiveRecord::Migration
  def change
    add_column :dream_tags, :user_id, :integer
  end
end
