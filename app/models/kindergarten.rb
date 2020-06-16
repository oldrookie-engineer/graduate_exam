class Kindergarten < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :address
    validates :phone_number, format: {with: /\A[0-9]{2,3}-[0-9]{1,4}-[0-9]{4}\z/}
  end
  has_many :stations, dependent: :destroy
  has_one :authorization, dependent: :destroy
  accepts_nested_attributes_for :stations, allow_destroy: true
  accepts_nested_attributes_for :authorization, allow_destroy: true
  mount_uploader :image, ImageUploader
  mount_uploader :cover_image, ImageUploader
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
