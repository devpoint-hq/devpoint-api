require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:user) }

    it { should validate_presence_of(:email) }
    # it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:username) }
    # it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:password_confirmation) }
  end

  describe 'assocations' do
    it { should have_many(:names) }
    it { should have_many(:links) }
    it { should have_many(:skills) }
    it { should have_many(:jobs) }
    it { should have_many(:appointments) }
  end
end
