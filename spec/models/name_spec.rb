require 'rails_helper'

RSpec.describe Name, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:name) }

    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end
end
