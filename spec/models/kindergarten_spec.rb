require "rails_helper"
RSpec.describe Kindergarten, type: :model do
  it 'nameが空ならバリデーションが通らない' do
    kindergarten = Kindergarten.new(name: '')
    expect(kindergarten).not_to be_valid
  end
  it 'addressが空ならバリデーションが通らない' do
    kindergarten = Kindergarten.new(address: '')
    expect(kindergarten).not_to be_valid
  end
  it 'phone_numberが空ならバリデーションが通らない' do
    kindergarten = Kindergarten.new(phone_number: '')
    expect(kindergarten).not_to be_valid
  end
end
