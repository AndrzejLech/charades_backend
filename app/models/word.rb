class Word < ApplicationRecord
  validates :word, presence: true, length: {in: 2..50}
  validates :category_id, presence: true
  belongs_to :category
end
