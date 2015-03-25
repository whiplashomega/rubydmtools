class AddCharacterToAttacks < ActiveRecord::Migration
  def change
    add_reference :attacks, :character, index: true
    add_foreign_key :attacks, :characters
  end
end
