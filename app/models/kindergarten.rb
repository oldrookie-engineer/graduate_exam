class Kindergarten < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true, format: {with: /\A[0-9]{2,3}-[0-9]{1,4}-[0-9]{4}\z/}
  has_many :stations, dependent: :destroy
  accepts_nested_attributes_for :stations, allow_destroy: true
end
