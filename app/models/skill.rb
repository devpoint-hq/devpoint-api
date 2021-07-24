class Skill < ApplicationRecord
  validates :name, presence: true
  validates :years_of_experience, numericality: true
  validates :number_of_projects, numericality: { only_integer: true }
  validates :self_rating, numericality: true

  belongs_to :user
end
