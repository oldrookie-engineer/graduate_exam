require 'rails_helper'
RSpec.describe Station, type: :model do
  it 'routeが空ならバリデーションが通らない' do
    station = Station.new(route: '')
    expect(station).not_to be_valid
  end
  it 'station_nameが空ならバリデーションが通らない' do
    station = Station.new(station_name: '')
    expect(station).not_to be_valid
  end
  it 'walk_timeが空ならバリデーションが通らない' do
    station = Station.new(walk_time: '')
    expect(station).not_to be_valid
  end
end
