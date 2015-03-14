class AddConditionsToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :conditions, :string
  end
end
