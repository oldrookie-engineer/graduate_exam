class ApplicationDocument < ApplicationRecord
  belongs_to :user
  scope :deadline, -> {
    where('processing_deadline <= ?', Time.current.next_day.end_of_day)
  }
  # scope :processing_complete, -> {
  #   where(processing: 2)
  # }
  enum processing: {
    未処理: 0,
    処理中: 1,
    処理済: 2
  }
end
