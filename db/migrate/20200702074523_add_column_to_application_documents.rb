class AddColumnToApplicationDocuments < ActiveRecord::Migration[5.2]
  def change
    add_column :application_documents, :processing, :integer, null: false, default: 0
  end
end
