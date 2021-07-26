class Income < ApplicationRecord
  has_many :users, through: :notes
  has_many :notes
  belongs_to :user
  
  
  validates :name, presence: true
  validates :amount, numericality: {other_than: 0}
  
end