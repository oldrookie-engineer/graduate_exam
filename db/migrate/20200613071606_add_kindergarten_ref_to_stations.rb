class AddKindergartenRefToStations < ActiveRecord::Migration[5.2]
  def change
    add_reference :stations, :kindergarten, foreign_key: true
  end
end
