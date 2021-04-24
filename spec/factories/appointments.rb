FactoryBot.define do
  factory :appointment do
    location { 'Comilla' }
    time { Faker::Time.forward(days: 5, period: :morning) }
    video_conf_link { Faker::Internet.unique.url }
    association :appointment_host, factory: :user
    association :appointment_guest, factory: :user
  end
end
