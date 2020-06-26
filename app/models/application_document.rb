class ApplicationDocument < ApplicationRecord
  belongs_to :user
  scope :deadline, -> {
    where('processing_deadline <= ?', Time.current.next_day.end_of_day)
  }
end
