class CreateMorningEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :morning_entries do |t|
      t.datetime :bedtime
      t.datetime :wakeup_time
      t.integer :ease_of_sleep
      t.integer :hours_of_sleep
      t.integer :morning_feeling
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
