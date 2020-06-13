class AddKindergartenRefToAuthorization < ActiveRecord::Migration[5.2]
  def change
    add_reference :authorizations, :kindergarten, foreign_key: true
  end
end
