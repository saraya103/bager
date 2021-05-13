class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.string     :name,           null: false
      t.integer    :price,          null: false
      t.integer    :count,          null: false
      t.string     :condition
      t.text       :memo
      t.string     :buyer,          null: false
      t.references :note,           foreign_key: true
      t.references :item,           foreign_key: true
      t.timestamps
    end
  end
end
