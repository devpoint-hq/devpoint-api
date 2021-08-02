class Employment < ApplicationRecord
  validates :title, presence: true
  validates :company_name, presence: true
  validates :start_date, presence: true, date: { before: :end_date }
  validates :end_date, presence: true, date: { after: :start_date }

  belongs_to :user
end
