class Archive < ApplicationRecord
  enum status_of_use: {
    在庫あり: 0,
    使用中: 1
  }
end
