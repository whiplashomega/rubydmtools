class AddMoreStaticVarsToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :passiveperception, :integer
    add_column :characters, :hitdice, :integer
    add_column :characters, :hitdicemax, :integer
  end
end
