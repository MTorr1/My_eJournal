class Responses < ActiveRecord::Migration[8.1]
  def change
    create_table :responses do |t|
      t.references :question, null: false, foreign_key: true
      t.references :journal_entry, null: false, foreign_key: true
      t.integer :numeric_value
      t.string :text_value
      t.timestamps
    end
  end
end
