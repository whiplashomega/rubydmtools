class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.integer :strength
      t.integer :dexterity
      t.integer :constitution
      t.integer :intelligence
      t.integer :wisdom
      t.integer :charisma
      t.integer :hp
      t.integer :hpmax

      t.timestamps null: false
    end
  end
end
