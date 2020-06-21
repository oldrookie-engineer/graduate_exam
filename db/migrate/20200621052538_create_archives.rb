class CreateArchives < ActiveRecord::Migration[5.2]
  def change
    create_table :archives do |t|
      t.string :name, null: false
      t.string :title, null: false
      t.date :installation_date, null: false
      t.integer :status_of_use, null: false
      t.timestamps
    end
  end
end
