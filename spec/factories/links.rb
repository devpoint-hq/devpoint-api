FactoryBot.define do
  factory :link do
    name { Faker::Name.unique.first_name }
    url { Faker::Internet.unique.url }
    association :user
  end
end
