class Appointment < ApplicationRecord
  validates :appointment_host_id, presence: true
  validates :appointment_guest_id, presence: true
  validates :location, presence: true
  validates :time, presence: true
  validates :video_conf_link, presence: true

  belongs_to :appointment_host, -> { where hiring_manager: true }, class_name: 'User', foreign_key: :appointment_host_id
  belongs_to :appointment_guest, -> { where developer: true }, class_name: 'User', foreign_key: :appointment_guest_id

  scope :hosted_by, ->(user) { where(appointment_host: user).includes(:appointment_guest) }
  scope :guested_by, ->(user) { where(appointment_guest: user).includes(:appointment_host) }
end
