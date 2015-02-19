class AddPublicToUsers < ActiveRecord::Migration
  def change
    add_column :users, :public_profile, :boolean
    add_column :users, :public_sleep_log, :boolean
  end
end
