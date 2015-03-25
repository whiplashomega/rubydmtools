class AddDetailsToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :appearance, :blob
    add_column :characters, :allies, :text
    add_column :characters, :backstory, :text
    add_column :characters, :treasure, :text
  end
end
