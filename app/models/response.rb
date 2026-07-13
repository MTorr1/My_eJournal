class Response < ApplicationRecord
    belongs_to :journal_entry
    belongs_to :question

    def hours=(val)
        @hours = val.to_s.present? ? val.to_i : nil
    end

    def hours
        @hours
    end
    
    def minutes=(val)
        @minutes = val.to_s.present? ? val.to_i : nil
    end

    def minutes
        @minutes
    end

    def display_value
        return text_value if text_value.present?
        return date_value if date_value.present?
        return screen_time_in_minutes if screen_time_in_minutes.present?
        
        # return time if time.present?

        if numeric_value.present?
            matched_option = question.question_options.find_by(value: numeric_value)
            return matched_option&.label || numeric_value
        end
         "No anwser provided"
    end

    validates :hours, :minutes, presence: true, numericality: {only_integer: true}, 
     if: Proc.new { |x| x.question.response_type == "time" }
    validates :hours, inclusion: {in: 0..24},
     if: Proc.new { |x| x.question.response_type == "time" }
    validates :minutes, inclusion: {in: 0..59},
     if: Proc.new { |x| x.question.response_type == "time" }

#  look at 4.3 https://guides.rubyonrails.org/active_record_validations.html#using-a-symbol-with-if-and-unless

    after_validation :calculate_screen_time_in_minutes

    private

    def calculate_screen_time_in_minutes
        return unless hours.present? && minutes.present?
        
        self.numeric_value = (hours * 60) + minutes
    end
end
#may need to change self.numeric_value to self.screen_time_in_minutes

