class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.string :date
      t.text :text

      t.timestamps null: false
    end
  end
end
