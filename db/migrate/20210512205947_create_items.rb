class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,           null: false
      t.integer    :price,          null: false
      t.integer    :count,          null: false       ,default: 1
      t.string     :condition
      t.text       :memo
      t.references :note,           foreign_key: true
      t.references :user,           foreign_key: true
      t.timestamps
    end
  end
end
