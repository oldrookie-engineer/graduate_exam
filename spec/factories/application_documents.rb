FactoryBot.define do
  factory :application_document do
    name { '第一' }
    title { '廃園届' }
    application_date { '2020-07-23' }
    processing_deadline { '2020-07-31' }
    processing { '0' }
  end
end
