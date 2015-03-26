class CreateAttacks < ActiveRecord::Migration
  def change
    create_table :attacks do |t|
      t.string :name
      t.integer :bonus
      t.string :damage

      t.timestamps null: false
    end
  end
end
