class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: {in: 2..20}
  has_many :words, dependent: :destroy
  belongs_to :user
end