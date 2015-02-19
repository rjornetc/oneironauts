class AddUsernameBioAdminAndPointsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :bio, :text
    add_column :users, :points, :integer
    add_column :users, :admin, :boolean
  end
end
