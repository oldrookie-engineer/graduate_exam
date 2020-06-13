class Authorization < ApplicationRecord
  belongs_to :kindergarten
  validates :principal, presence: true
end
