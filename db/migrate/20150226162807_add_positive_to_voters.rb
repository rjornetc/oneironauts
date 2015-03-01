class AddPositiveToVoters < ActiveRecord::Migration
  def change
    add_column :voters, :positive, :boolean
  end
end
