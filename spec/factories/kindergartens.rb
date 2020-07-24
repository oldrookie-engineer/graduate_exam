FactoryBot.define do
  factory :kindergarten do
    name { '第一' }
    address { '中野区中野1-1-1' }
    phone_number { '03-1111-1111' }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/園庭.jpg')) }
    cover_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/園舎.jpg')) }
    after(:build) do |kindergarten|
      kindergarten.stations << build(:station, kindergarten: kindergarten)
    end
    after(:build) do |kindergarten|
      kindergarten.authorization ||= build(:authorization, kindergarten: kindergarten)
    end
  end
  factory :second_kindergarten, class: Kindergarten do
    name { '第二' }
    address { '中野区中野2-2-2' }
    phone_number { '03-2222-2222' }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/園庭.jpg')) }
    cover_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/園舎.jpg')) }
    after(:build) do |kindergarten|
      kindergarten.stations << build(:station, kindergarten: kindergarten)
    end
    after(:build) do |kindergarten|
      kindergarten.authorization ||= build(:authorization, kindergarten: kindergarten)
    end
  end
end
