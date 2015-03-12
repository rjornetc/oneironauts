class AddDescriptionToAchievements < ActiveRecord::Migration
  def change
    add_column :achievements, :description, :text
  end
end
