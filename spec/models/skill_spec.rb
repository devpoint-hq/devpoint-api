require 'rails_helper'

RSpec.describe Skill, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:skill) }

    it { should validate_presence_of(:name) }
  end
end
