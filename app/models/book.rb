class Book < ApplicationRecord
    validates :author, presence: true, length: { maximum: 50 }
    validates :title,  presence: true, length: { maximum: 50 }
end
