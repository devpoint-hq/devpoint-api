require 'rails_helper'

RSpec.describe Job, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:job) }

    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:company_name) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end
end
