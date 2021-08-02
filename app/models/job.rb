class Job < ApplicationRecord
  validates :title, presence: true
  validates :company_name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  belongs_to :user
end
