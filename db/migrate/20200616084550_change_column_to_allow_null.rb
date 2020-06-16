class ChangeColumnToAllowNull < ActiveRecord::Migration[5.2]
  def change
    change_column :kindergartens, :latitude, :float, null: true
    change_column :kindergartens, :longitude, :float, null: true
  end
end
