require 'rails_helper'
RSpec.describe ApplicationDocument, type: :model do
  it 'nameが空ならバリデーションが通らない' do
    application_document = ApplicationDocument.new(name: '')
    expect(application_document).not_to be_valid
  end
  it 'titleが空ならバリデーションが通らない' do
    application_document = ApplicationDocument.new(title: '')
    expect(application_document).not_to be_valid
  end
  it 'application_dateが空ならバリデーションが通らない' do
    application_document = ApplicationDocument.new(application_date: '')
    expect(application_document).not_to be_valid
  end
  it 'processing_deadlineが空ならバリデーションが通らない' do
    application_document = ApplicationDocument.new(processing_deadline: '')
    expect(application_document).not_to be_valid
  end
  it 'processingが空ならバリデーションが通らない' do
    application_document = ApplicationDocument.new(processing: '')
    expect(application_document).not_to be_valid
  end
end
