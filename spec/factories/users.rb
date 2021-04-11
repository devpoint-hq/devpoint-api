FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    username { Faker::Internet.unique.username(specifier: 5..20) }
    password { Faker::Internet.password(min_length: 10, max_length: 20) }
    password_confirmation { password }
    admin { false }
    hiring_manager { true }
    developer { false }
  end
end
