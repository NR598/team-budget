class Expense < ApplicationRecord
  has_many :users, through: :notes
  has_many :notes
  belongs_to :user
  before_save {self.amount * -1}
  # before_create {self.amount * -1}
  # before_update {self.amount * -1}
  
  
  validates :name, presence: true
  validates :amount, numericality: {other_than: 0}

end