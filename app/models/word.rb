class Word < ApplicationRecord
  belongs_to :category
  validates :word, presence: true
end
