class AddAchievableTypeToBadges < ActiveRecord::Migration
  def change
    add_column :badges, :achievable_type, :string
  end
end
