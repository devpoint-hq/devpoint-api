class User < ApplicationRecord
  acts_as_token_authenticatable

  devise :database_authenticatable, :validatable

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true, length: { in: 5..20 }
  validates :password, presence: true
  validates :password_confirmation, presence: true

  has_one_attached :profile_image
  has_many :links, dependent: :delete_all
  has_many :skills, dependent: :delete_all
  has_many :jobs, dependent: :delete_all

  has_many :appointments, class_name: 'Appointment', foreign_key: :appointment_host_id, dependent: :delete_all

  scope :all_with_developer_details, -> { where(developer: true).includes(:links, :skills, :jobs) }
  scope :is_developer_with_details, (lambda do |id|
    where(developer: true).where(id: id).includes(:links, :skills, :jobs).first
  end)
end
