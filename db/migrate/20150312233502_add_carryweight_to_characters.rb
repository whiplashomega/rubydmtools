class AddCarryweightToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :carryweight, :float
    add_column :characters, :copper, :integer
    add_column :characters, :silver, :integer
    add_column :characters, :gold, :integer
    add_column :characters, :platinum, :integer
  end
end
