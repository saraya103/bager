class CreateReserves < ActiveRecord::Migration[6.0]
  def change
    create_table :reserves do |t|
      t.date       :date,           null: false
      t.integer    :next_id,        null: false, default: 0
      t.integer    :once,           null: false, default: 0
      t.references :note,           foreign_key: true
      t.references :item,           foreign_key: true
      t.timestamps
    end
  end
end
