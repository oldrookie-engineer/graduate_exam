FactoryBot.define do
  factory :application_document do
    name { '第一' }
    title { '園長選任届' }
    application_date { '2020-07-23' }
    processing_deadline { '2020-07-31' }
    processing { '未処理' }
    user
  end
  factory :second_application_document, class: ApplicationDocument do
    name { '第二' }
    title { '資産総額変更届' }
    application_date { '2020-07-01' }
    processing_deadline { '2020-08-31' }
    processing { '処理中' }
    user
  end
end
