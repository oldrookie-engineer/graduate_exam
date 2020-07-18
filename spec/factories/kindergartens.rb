FactoryBot.define do
  factory :kindergarten do
    name { '第一' }
    address { '中野区中野1-1-1' }
    phone_number { '03-1111-1111' }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/園舎.jpg')) }
    # cover_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/園地.jpg')) }
  end
end
