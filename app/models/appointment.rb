class Appointment < ApplicationRecord
  validates :appointment_host_id, presence: true
  validates :appointment_guest_id, presence: true
  validates :location, presence: true
  validates :time, presence: true

  belongs_to :appointment_host, -> { where hiring_manager: true }, class_name: 'User'
  belongs_to :appointment_guest, -> { where developer: true }, class_name: 'User'

  scope :with_guest_details, -> { includes :appointment_guest }
  scope :with_host_details, -> { includes :appointment_host }
end
