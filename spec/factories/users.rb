FactoryBot.define do
  factory :user do
    id { '1' }
    name { 'fujimoto' }
    email { '1@a.com' }
    password { '00000000' }
    password_confirmation { '00000000' }
    admin { false }
  end
  factory :admin_user, class: User do
    id { '2' }
    name { '管理者' }
    email { '2@b.com' }
    password { '11111111' }
    password_confirmation { '11111111' }
    admin { true }
  end
end
