class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string     :character,          null: false, unique: true
      t.string     :password,           null: false
      t.integer    :owner,              null: false
      t.string     :owner_name,         null: false
      t.string     :title,              null: false, default: '新しいノート'
      t.integer    :genre_id,           null: false, default: 1
      t.string     :list_name,          null: false, default: '登録中のリスト'
      t.string     :log_name,           null: false, default: '購入履歴'
      t.string     :reserve_name,       null: false, default: '予約一覧'
      t.string     :item_name,          null: false, default: 'アイテム一覧'
      t.timestamps
    end
  end
end
