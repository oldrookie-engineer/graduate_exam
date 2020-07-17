class Station < ApplicationRecord
  with_options presence: true do
    validates :route
    validates :station_name
    validates :walk_time
  end
  belongs_to :kindergarten
end
