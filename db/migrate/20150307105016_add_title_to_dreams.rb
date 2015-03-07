class AddTitleToDreams < ActiveRecord::Migration
  def change
    add_column :dreams, :title, :string
  end
end
