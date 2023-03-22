FactoryBot.define do
  factory :user do
    email { 'bot1@test.com' }
    password { '123456' }
    password_confirmation { '123456' }
    confirmed_at { Time.current }
  end
end
