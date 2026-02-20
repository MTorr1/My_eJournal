class CreateJournalEntries < ActiveRecord::Migration[8.1]
  def change
    create_table :journal_entries do |t|
      t.string :title
      t.text :body
      t.date :entry_date
      t.date :last_updated_date #this may be overcomplicating things
      t.string :mood
      t.string :q1 #How did I sleep?
      t.string :q2 #Did I train before work?
      t.string :q3 #How intense did I train
      t.string :q4 #How do I feel?

      t.timestamps
    end
  end
end



# As I added title here do I need to migrateDB or not?