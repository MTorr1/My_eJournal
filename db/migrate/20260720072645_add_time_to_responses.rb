class AddTimeToResponses < ActiveRecord::Migration[8.1]
  def change
    add_column :responses, :time, :time
  end
end
