class CreateNoteUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :note_users do |t|
      t.references :note, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
