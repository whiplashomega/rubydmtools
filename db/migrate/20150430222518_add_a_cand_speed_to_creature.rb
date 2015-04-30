class AddACandSpeedToCreature < ActiveRecord::Migration
  def change
    add_column :characters, :ac, :integer
    add_column :characters, :speed, :string
  end
end
