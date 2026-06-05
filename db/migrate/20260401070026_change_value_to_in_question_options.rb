class ChangeValueToInQuestionOptions < ActiveRecord::Migration[8.1]
  def change
    change_column :question_options, :value, :string
  end
end
