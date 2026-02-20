class Question < ApplicationRecord
    has_many :responses
    has_many :journal_entries through: :responses
end
