FactoryBot.define do
  # pass = Faker::Internet.password(8)

  factory :user do
    name { 'fujimoto' }
    email { '1@a.com' }
    password { '00000000' }
    password_confirmation { '00000000' }
  end
end
