class CreateAuthorizations < ActiveRecord::Migration[5.2]
  def change
    create_table :authorizations do |t|
      t.string :principal, null: false
      t.date :installation_date, null: false
      t.integer :number_of_classes, null: false
      t.integer :capacity, null: false
      t.integer :number_of_students, null: false
      t.integer :school_area, null: false
      t.integer :school_floor_area, null: false
      t.timestamps
    end
  end
end
