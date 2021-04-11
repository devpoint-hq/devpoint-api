FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    username { Faker::Internet.unique.username }
    password { Faker::Internet.password }
    password_confirmation { password }
    admin { false }
    hiring_manager { true }
    developer { false }
  end
end
