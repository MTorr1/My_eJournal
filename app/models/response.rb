class Response < ApplicationRecord
    belongs_to :journal_entry
    belongs_to :question

    def response_label
        if text_value.present?
            return text_value
        elsif date_value.present?
            return date_value
        elsif screen_time_in_minutes.present?
            return screen_time_in_minutes #update this when I fix screentime picker
        elsif numeric_value.present?
            return question.question_options.find_by(value: numeric_value)&.label
        end
    end
end


# I need to build a method in here that will display my response values
# then I can call <%= response.display_value %> in my view

# I did this as apparently thie best way to call data is from inside the model.


# I am trying to use find_by to find the associated label to a Database entry. Numeric_value apparently needs to eb the name of the column in my DB
# I can not find column names
