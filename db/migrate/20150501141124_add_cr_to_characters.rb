class AddCrToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :cr, :float
  end
end
