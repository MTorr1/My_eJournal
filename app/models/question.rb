class Question < ApplicationRecord
    has_many :responses
    has_many :question_options, dependent: :destroy
    has_many :journal_entries, through: :responses
end
