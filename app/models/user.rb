class User < ApplicationRecord
<<<<<<< Updated upstream
=======
  has_many :categories, dependent: :destroy
  has_many :games, dependent: :destroy
>>>>>>> Stashed changes
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  acts_as_token_authenticatable
end
