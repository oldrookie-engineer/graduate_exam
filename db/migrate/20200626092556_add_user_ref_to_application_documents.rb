class AddUserRefToApplicationDocuments < ActiveRecord::Migration[5.2]
  def change
    add_reference :application_documents, :user, foreign_key: true
  end
end
