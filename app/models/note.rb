class Note < ApplicationRecord
  has_many :users, through: :expenses
  has_many :users, through: :incomes  
end