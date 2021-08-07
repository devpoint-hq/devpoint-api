class User < ApplicationRecord
  devise :database_authenticatable, :validatable, :confirmable

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true, length: { in: 5..20 }
  validates :password, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :create

  has_one_attached :profile_image
  has_many :links, dependent: :delete_all
  has_many :skills, dependent: :delete_all
  has_many :employments, dependent: :delete_all

  has_many :appointments, class_name: 'Appointment', foreign_key: :appointment_host_id, dependent: :delete_all

  scope :all_with_developer_details, -> { where(developer: true).includes(:links, :skills, :employments) }
  scope :is_developer_with_details, (lambda do |id|
    where(developer: true).where(id: id).includes(:links, :skills, :employments).first
  end)

  def profile_image_url
    profile_image.blob.service_url if profile_image.attached?
  end
end
