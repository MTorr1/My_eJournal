class Questions < ActiveRecord::Migration[8.1]
  def change
    create_table :questions do |t|
      t.string :content #the question
      t.string :response_type #integer, string, boolean
      t.integer :position #keeps question in an order
      t.timestamps
    end
  end
end
