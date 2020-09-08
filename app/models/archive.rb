class Archive < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :title
    validates :installation_date
    validates :status_of_use
  end
  enum status_of_use: {
    使用可: 0,
    使用不可: 1
  }
  scope :title_search, lambda { |title|
    where(title: title)
  }
end
