class Job < ApplicationRecord
  validates :title, presence: true
  validates :company_name, presence: true
  
  belongs_to :user
end
