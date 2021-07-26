class Transaction < ApplicationRecord
  has_many :users, through: :notes
  has_many :notes
  belongs_to :user  
  validates :name, presence: true
  validates :amount, presence: true

end