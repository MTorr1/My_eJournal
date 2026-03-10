class JournalEntry < ApplicationRecord
    validates :body, :title, presence: true # I am not sure if this is correct
    has_many :responses
    has_many :questions, through: :responses
    accepts_nested_attributes_for :responses
end
