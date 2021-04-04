class User < ApplicationRecord
  acts_as_token_authenticatable

  devise :database_authenticatable, :validatable

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true, length: { in: 5..20 }
  validates :password, presence: true
  validates :password_confirmation, presence: true

  has_one_attached :profile_image
  has_one :name, dependent: :destroy
  has_many :links, dependent: :delete_all
  has_many :skills, dependent: :delete_all
  has_many :hosted_appointments, class_name: 'Appointment', foreign_key: :appointment_host_id, dependent: :delete_all
  has_many :guested_appointments, class_name: 'Appointment', foreign_key: :appointment_guest_id, dependent: :delete_all
end
