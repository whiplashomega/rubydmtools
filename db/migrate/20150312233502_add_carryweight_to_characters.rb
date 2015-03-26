class AddCarryweightToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :carryweight, :float
  end
end
