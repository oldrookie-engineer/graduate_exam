require "rails_helper"
RSpec.describe Authorization, type: :model do
  it 'principalが空ならバリデーションが通らない' do
    authorization = Authorization.new(principal: '')
    expect(authorization).not_to be_valid
  end
  it 'installation_dateが空ならバリデーションが通らない' do
    authorization = Authorization.new(installation_date: '')
    expect(authorization).not_to be_valid
  end
  it 'number_of_classesが空ならバリデーションが通らない' do
    authorization = Authorization.new(number_of_classes: '')
    expect(authorization).not_to be_valid
  end
  it 'capacityが空ならバリデーションが通らない' do
    authorization = Authorization.new(capacity: '')
    expect(authorization).not_to be_valid
  end
  it 'number_of_classesが空ならバリデーションが通らない' do
    authorization = Authorization.new(number_of_classes: '')
    expect(authorization).not_to be_valid
  end
  it 'school_areaが空ならバリデーションが通らない' do
    authorization = Authorization.new(school_area: '')
    expect(authorization).not_to be_valid
  end
  it 'school_floor_areaが空ならバリデーションが通らない' do
    authorization = Authorization.new(school_floor_area: '')
    expect(authorization).not_to be_valid
  end
end
