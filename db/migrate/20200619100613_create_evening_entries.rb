class CreateEveningEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :evening_entries do |t|
      t.integer :caffeine_morning
      t.integer :caffeine_afternoon
      t.integer :caffeine_evening
      t.boolean :nap_morning
      t.boolean :nap_afternoon
      t.boolean :nap_evening
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
