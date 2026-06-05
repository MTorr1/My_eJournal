class AddDateValueToResponses < ActiveRecord::Migration[8.1]
  def change
    add_column :responses, :date_value, :date
  end
end
