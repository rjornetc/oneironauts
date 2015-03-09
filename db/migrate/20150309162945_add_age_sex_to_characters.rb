class AddAgeSexToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :age, :integer
    add_column :characters, :gender, :integer
  end
end
