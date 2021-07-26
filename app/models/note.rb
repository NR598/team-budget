class Note < ApplicationRecord
  has_many :users, through: :expenses
  has_many :users, through: :incomes
  belongs_to :user
  belongs_to :expense  
  validates :body, presence: true, length: { minimum: 1 }
end