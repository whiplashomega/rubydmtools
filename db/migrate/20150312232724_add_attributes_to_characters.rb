class AddAttributesToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :inspiration, :integer
    add_column :characters, :proficiencybonus, :integer
    add_column :characters, :strengthsave, :integer
    add_column :characters, :dexteritysave, :integer
    add_column :characters, :constitutionsave, :integer
    add_column :characters, :intelligencesave, :integer
    add_column :characters, :wisdomsave, :integer
    add_column :characters, :charismasave, :integer
  end
end
