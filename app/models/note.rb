class Note < ApplicationRecord
  has_many :users, through: :expenses
  has_many :users, through: :incomes
  belongs_to :user
  belongs_to :expense  
end