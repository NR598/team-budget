class Transaction < ApplicationRecord
  has_many :users, through: :notes
  has_many :notes
  belongs_to :user  
  validates :name, presence: true
  validates :amount, numericality: {less_than: 0}

end