class Category < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: {in: 2..20}
  validates :user_id, presence: true, numericality: true
  has_many :words, dependent: :destroy
end