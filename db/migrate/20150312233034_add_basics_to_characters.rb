class AddBasicsToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :name, :string
    add_column :characters, :classlevel, :string
    add_column :characters, :background, :string
    add_column :characters, :race, :string
    add_column :characters, :alignment, :string
    add_column :characters, :experiencepoints, :integer
  end
end
