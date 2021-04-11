require 'rails_helper'

RSpec.describe Appointment, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:appointment) }

    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:time) }
  end

  describe 'associations' do
    it { should belong_to(:appointment_host) }
    it { should belong_to(:appointment_guest) }
  end
end
