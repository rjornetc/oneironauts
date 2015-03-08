class AddPersonalityToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :personality, :text
  end
end
