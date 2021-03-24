class Appointment < ApplicationRecord
  validates :appointment_host_id, presence: true
  validates :appointment_guest_id, presence: true
  validates :time, presence: true
  validates :online_link, presence: true
end
