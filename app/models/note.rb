class Note < ApplicationRecord
  has_many :users, through: :expenses, dependent: :destroy
  has_many :users, through: :incomes, dependent: :destroy
  belongs_to :user
  belongs_to :expense  
  validates :body, presence: true, length: { minimum: 1 }
end