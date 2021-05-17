class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.references :note,           foreign_key: true
      t.references :item,           foreign_key: true
      t.timestamps
    end
  end
end
