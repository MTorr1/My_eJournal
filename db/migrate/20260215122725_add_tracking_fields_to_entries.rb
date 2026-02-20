class AddTrackingFieldsToEntries < ActiveRecord::Migration[8.1]
  def change
    add_column :journal_entries, :mood_tag, :string
    add_column :journal_entries, :protine_goal, :boolean
    add_column :journal_entries, :phone_screen_time, :float 
    add_column :journal_entries, :negative_event, :boolean
    add_column :journal_entries, :negative_event_details, :text
    add_column :journal_entries, :saw_friends_24h, :boolean
    add_column :journal_entries, :self_development, :boolean
  end
end
