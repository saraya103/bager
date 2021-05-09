class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes, id: :string do |t|
      t.string  :password,           null: false
      t.integer :owner,              null: false
      t.integer :genre_id,           null: false
      t.string  :list_name,          null: false
      t.string  :log_name,           null: false
      t.string  :reserve_name,       null: false
      t.string  :item_name,          null: false
      t.timestamps
    end
  end
end
