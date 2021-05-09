class CreateNoteUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :note_users, note: :string do |t|
      t.string :note_id, index: true
      t.references :user, foreign_key: true
      t.timestamps
    end
    add_foreign_key :note_users, :notes, column: :note_id
  end
end
