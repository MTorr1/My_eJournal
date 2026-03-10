class CreateJournalEntries < ActiveRecord::Migration[8.1]
  def change
    create_table :journal_entries do |t|
      t.string :title
      t.text :body
      t.date :entry_date
      t.timestamps
    end
  end
end



# As I added title here do I need to migrateDB or not?