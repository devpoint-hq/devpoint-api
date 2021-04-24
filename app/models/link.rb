class Link < ApplicationRecord
  validates :name, presence: true
  validates :url, presence: true, uniqueness: true
  validates :user_id, presence: true

  belongs_to :user
end
