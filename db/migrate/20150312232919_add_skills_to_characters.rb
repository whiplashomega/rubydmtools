class AddSkillsToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :acrobatics, :integer
    add_column :characters, :animalhandling, :integer
    add_column :characters, :arcana, :integer
    add_column :characters, :athletics, :integer
    add_column :characters, :deception, :integer
    add_column :characters, :history, :integer
    add_column :characters, :insight, :integer
    add_column :characters, :intimidation, :integer
    add_column :characters, :investigation, :integer
    add_column :characters, :medicine, :integer
    add_column :characters, :nature, :integer
    add_column :characters, :perception, :integer
    add_column :characters, :performance, :integer
    add_column :characters, :persuasion, :integer
    add_column :characters, :religion, :integer
    add_column :characters, :slightofhand, :integer
    add_column :characters, :stealth, :integer
    add_column :characters, :survival, :integer
  end
end
