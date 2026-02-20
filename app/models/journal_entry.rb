class JournalEntry < ApplicationRecord
    validates :body, :title, presence: true # I am not sure if this is correct
    has_many :responses
end
