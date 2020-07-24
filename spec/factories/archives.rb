FactoryBot.define do
  factory :archive do
    name { '第一' }
    title { '園長選任届' }
    installation_date { '2000-07-23' }
    status_of_use { '在庫あり' }
  end
  factory :second_archive, class: Archive do
    name { '第二' }
    title { '資産総額変更届' }
    installation_date { '1995-07-01' }
    status_of_use { '使用中' }
  end
end
