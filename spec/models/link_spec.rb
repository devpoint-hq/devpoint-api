require 'rails_helper'

RSpec.describe Link, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:link) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:url) }
    it { should validate_uniqueness_of(:url) }
  end
end
