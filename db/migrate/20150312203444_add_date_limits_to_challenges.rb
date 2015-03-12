class AddDateLimitsToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :limit_date, :datetime
  end
end
