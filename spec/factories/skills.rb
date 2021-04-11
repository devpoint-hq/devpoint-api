FactoryBot.define do
  factory :skill do
    name { 'React' }
    association :user
  end
end
