class Response < ApplicationRecord
    belongs_to :journal_entry
    belongs_to :question

#     attr_accessor :screen_time_in_minutes
#     def initializer(hours, minutes)
#         @hour = :hours
#         @minute = :minutes
#         @screen_time_in_minutes = (:hours * 60) + :minutes
#     end

#     validates :hours, numericality: {
#         greater_than_or_equal_to: 0,
#         less_than_or_equal_to: 24 
#     }
    
#     validates :minutes, numericality: {
#         greater_than_or_equal_to: 0,
#         less_than_or_equal_to: 59 
#     }
# end
# unsure if I need to write (:hours, :minutes) in my ()
# unsure if my validations work


# Second attempt at writing this code

    # attr_accessor :hours, :minutes
    # replacing the attr_accessor with the below
    #  replacement worked. It allowed me to change the data type 

    def hours=(val)
        @hours = val.to_s.present? ? val.to_i : nill
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


