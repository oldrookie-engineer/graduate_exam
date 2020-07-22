FactoryBot.define do
  factory :kindergarten do
    name { '第一' }
    address { '中野区中野1-1-1' }
    phone_number { '03-1111-1111' }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/園舎.jpg')) }
    cover_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/園庭.jpg')) }
    after(:build) do |kindergarten|
      kindergarten.stations << build(:station, kindergarten: kindergarten)
    end
    after(:build) do |kindergarten|
      kindergarten.authorization ||= build(:authorization, kindergarten: kindergarten)
    end
    # after(:build) do |kindergarten|
    #   kindergarten.stations << FactoryBot.create(:station, route: "東西", station_name: '落合', walk_time: '10')
    # end
    # after(:build) do |kindergarten|
    #   kindergarten.authorizations << FactoryBot.create(:authorization, principal: "中野太郎", installation_date: "1979-11-20", number_of_classes: "5", capacity: "175", number_of_students: "150", school_area: "500", school_floor_area: "700")
    # end
  end
end
