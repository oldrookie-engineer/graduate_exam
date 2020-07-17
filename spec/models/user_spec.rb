require "rails_helper"
RSpec.describe User, type: :model do
  it 'nameが空ならバリデーションが通らない' do
    user = User.new(name: '')
    expect(user).not_to be_valid
  end
  it 'emailが空ならバリデーションが通らない' do
    user = User.new(email: '')
    expect(user).not_to be_valid
  end
  it 'encrypted_passwordが空ならバリデーションが通らない' do
    user = User.new(encrypted_password: '')
    expect(user).not_to be_valid
  end
end 
