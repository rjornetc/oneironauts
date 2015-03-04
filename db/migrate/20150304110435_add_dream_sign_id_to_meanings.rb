class AddDreamSignIdToMeanings < ActiveRecord::Migration
  def change
    add_column :meanings, :dream_sign_id, :integer
  end
end
