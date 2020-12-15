class Word < ApplicationRecord
  belongs_to :category
  validates :user_id, presence: true, numericality: true
  validates :category_id, presence: true, numericality: true
  validates :word, presence: true, length: {in: 2..50}
  validates :category_id, presence: true

end
