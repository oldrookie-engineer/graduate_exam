FactoryBot.define do
  factory :station do
    association :kindergarten, factory: :kindergarten
    route { '東西' }
    station_name { '落合' }
    walk_time { '10' }
  end
end
