FactoryBot.define do
  factory :job do
    title { 'Software Developer' }
    company_name { 'Freelance' }
    association :user
  end
end
