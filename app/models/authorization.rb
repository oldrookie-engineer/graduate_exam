class Authorization < ApplicationRecord
  belongs_to :kindergarten
  with_options presence: true do
    validates :principal
    validates :installation_date
    validates :number_of_classes
    validates :capacity
    validates :number_of_students
    validates :school_area
    validates :school_floor_area
  end
end
