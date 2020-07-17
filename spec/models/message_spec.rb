require "rails_helper"
RSpec.describe Message, type: :model do
  it 'bodyが空ならバリデーションが通らない' do
    message = Message.new(body: '')
    expect(message).not_to be_valid
  end
end
