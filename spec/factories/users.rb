FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    username { Faker::Internet.unique.username(specifier: 5..20) }
    password { '12345678' }
    password_confirmation { '12345678' }
    admin { false }
    hiring_manager { false }
    developer { true }
  end
end
