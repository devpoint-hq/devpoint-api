FactoryBot.define do
  factory :name do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    other_names { Faker::Name.last_name }
    association :user
  end
end
