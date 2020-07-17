require "rails_helper"
RSpec.describe Archive, type: :model do
  it 'nameが空ならバリデーションが通らない' do
    archive = Archive.new(name: '')
    expect(archive).not_to be_valid
  end
  it 'titleが空ならバリデーションが通らない' do
    archive = Archive.new(title: '')
    expect(archive).not_to be_valid
  end
  it 'installation_dateが空ならバリデーションが通らない' do
    archive = Archive.new(installation_date: '')
    expect(archive).not_to be_valid
  end
  it 'status_of_useが空ならバリデーションが通らない' do
    archive = Archive.new(status_of_use: '')
    expect(archive).not_to be_valid
  end
end
