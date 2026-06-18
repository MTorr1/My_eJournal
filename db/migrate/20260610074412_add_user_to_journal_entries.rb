class AddUserToJournalEntries < ActiveRecord::Migration[8.1]
  def change
    add_reference :journal_entries, :user, null: false, foreign_key: true
  end
end
