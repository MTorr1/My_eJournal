class JournalEntry < ApplicationRecord
    validates :body, :title, presence: true # I am not sure if this is correct
    has_many :responses, dependent: :destroy
    has_many :questions, through: :responses
    accepts_nested_attributes_for :responses,
                                allow_destroy: true,
                                reject_if: :all_blank
    belongs_to :user
end
