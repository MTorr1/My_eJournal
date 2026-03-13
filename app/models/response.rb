class Response < ApplicationRecord
    belongs_to :journal_entry
    belongs_to :question
end
