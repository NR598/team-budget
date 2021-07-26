class User < ApplicationRecord
  before_save { email.downcase! }
  before_save { name.capitalize! }
  has_secure_password
  has_many :expenses
  has_many :notes, through: :expenses
  has_many :incomes
  has_many :notes, through: :incomes

  validates :password, presence: true, length: { minimum: 6 }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 50 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
end
