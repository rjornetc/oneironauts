class AddConditionsToAchievements < ActiveRecord::Migration
  def change
    add_column :achievements, :conditions, :string
  end
end
