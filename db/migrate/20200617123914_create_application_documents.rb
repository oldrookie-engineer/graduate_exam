class CreateApplicationDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :application_documents do |t|
      t.string :name, null: false
      t.string :title, nill: false
      t.date :application_date, null: false
      t.date :processing_deadline, null: false
      t.timestamps
    end
  end
end
