class ApplicationDocument < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :title
    validates :application_date
    validates :processing_deadline
    validates :processing
  end
  validate :date_not_before_today
  belongs_to :user
  scope :deadline, lambda {
    where('processing_deadline <= ?', Time.current.next_day(3).end_of_day).where('(processing = ?) OR (processing = ?)', 0, 1)
  }
  scope :processing_complete, lambda {
    where(processing: 2)
  }
  scope :processing_incomplete, lambda {
    where('(processing = ?) OR (processing = ?)', 0, 1)
  }
  enum processing: {
    未処理: 0,
    処理中: 1,
    処理済: 2
  }

  def date_not_before_today
    if processing_deadline.nil? || processing_deadline < Date.today
      errors.add(:processing_deadline, 'は、本日以降のものを選択してください')
    end
  end
end
