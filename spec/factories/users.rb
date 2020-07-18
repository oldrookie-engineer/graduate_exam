FactoryBot.define do
  factory :user do
    name { 'fujimoto' }
    email { '1@a.com' }
    password { '00000000' }
    password_confirmation { '00000000' }
    admin { false }
  end
end
