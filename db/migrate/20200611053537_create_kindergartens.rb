class CreateKindergartens < ActiveRecord::Migration[5.2]
  def change
    create_table :kindergartens do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.integer :phone_number, null: false
      t.string :image
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.timestamps
    end
  end
end
