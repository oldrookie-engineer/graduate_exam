FactoryBot.define do
  factory :authorization do
    association :kindergarten, factory: :kindergarten
    principal { '中野太朗' }
    installation_date { '1973/01/01' }
    number_of_classes { '3' }
    capacity { '100' }
    number_of_students { '95' }
    school_area { '300' }
    school_floor_area { '500' }
  end
end
