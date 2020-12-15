class User < ApplicationRecord
  has_many :categories, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  acts_as_token_authenticatable

end
