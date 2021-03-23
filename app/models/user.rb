class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true, length: { in: 5..20 }
  validates :password, presence: true
  validates :password_confirmation, presence: true
end
