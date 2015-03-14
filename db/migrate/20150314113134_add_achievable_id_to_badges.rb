class AddAchievableIdToBadges < ActiveRecord::Migration
  def change
    add_column :badges, :achievable_id, :integer
  end
end
