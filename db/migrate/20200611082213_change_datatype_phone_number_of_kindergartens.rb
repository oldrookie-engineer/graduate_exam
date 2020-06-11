class ChangeDatatypePhoneNumberOfKindergartens < ActiveRecord::Migration[5.2]
  def change
    change_column :kindergartens, :phone_number, :string
  end
end
