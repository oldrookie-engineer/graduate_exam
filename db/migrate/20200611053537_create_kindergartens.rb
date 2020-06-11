class CreateKindergartens < ActiveRecord::Migration[5.2]
  def change
    create_table :kindergartens do |t|

      t.timestamps
    end
  end
end
