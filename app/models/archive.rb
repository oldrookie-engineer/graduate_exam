class Archive < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :title
    validates :installation_date
    validates :status_of_use
  end
  enum status_of_use: {
    在庫あり: 0,
    使用中: 1
  }
  scope :title_search, -> (title) {
    where(title: title)
  }
end
