class AddTextVarsToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :proficiencies, :text
    add_column :characters, :equipment, :text
    add_column :characters, :featurestraits, :text
    add_column :characters, :flaws, :text
    add_column :characters, :bonds, :text
    add_column :characters, :ideals, :text
    add_column :characters, :personalitytraits, :text
  end
end
