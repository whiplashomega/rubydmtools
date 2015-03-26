class AddTextVarsToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :proficiencies, :text
    add_column :characters, :equipment, :text
    add_column :characters, :featurestraits, :text
  end
end
