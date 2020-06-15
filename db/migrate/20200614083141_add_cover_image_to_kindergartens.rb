class AddCoverImageToKindergartens < ActiveRecord::Migration[5.2]
  def change
    add_column :kindergartens, :cover_image, :string
  end
end
