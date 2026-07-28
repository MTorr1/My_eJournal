class Question < ApplicationRecord
    has_many :responses, -> {order(position: :asc)}
    has_many :question_options, dependent: :destroy
    has_many :journal_entries, through: :responses

    def storage_column
    case response_type
        when 'string', 'text'
            :text_value
        when 'integer', "float", "boolean"
            :numeric_value
        else 
            :date_value
# added date value as all my text fields where rending as date values
# added boolean to first when
#  had to add integer to elsif
        end
    end
end
