class Name < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :user_id, presence: true

  belongs_to :user
end
