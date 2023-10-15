FactoryBot.define do
  factory :user do
    last_name { "Example" }
    first_name { "User" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
