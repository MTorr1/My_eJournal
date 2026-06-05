class AddScreenTimeInMinutesToResponses < ActiveRecord::Migration[8.1]
  def change
    add_column :responses, :screen_time_in_minutes, :Time
  end
end
