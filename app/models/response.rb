class Response < ApplicationRecord
    belongs_to :journal_entry
    belongs_to :question
    validates :question, :journal_entry, presence: true
end
