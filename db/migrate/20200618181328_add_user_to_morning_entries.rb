class AddUserToMorningEntries < ActiveRecord::Migration[6.0]
  def change
    add_reference :morning_entries, :user, null: false, foreign_key: true
  end
end
