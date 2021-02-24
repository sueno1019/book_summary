class Preinfo < ApplicationRecord
    validates :book_id, presence: true
    validates :question, presence: true, length: { maximum: 50 }
end
