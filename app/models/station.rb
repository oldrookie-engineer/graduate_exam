class Station < ApplicationRecord
  validates :route, presence: true
  validates :station_name, presence: true
  validates :walk_time, presence: true
  belongs_to :kindergarten
end
