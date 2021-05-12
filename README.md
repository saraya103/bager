## users テーブル

|Column             |Type    |Options                 |
|-------------------|--------|------------------------|
|email              |string  |null:false, unique:true |
|encrypted_password |string  |null:false              |
|first_name         |string  |null:false              |
|last_name          |string  |null:false              |
|nickname           |string  |null:false              |
|count              |integer |null:false              |
|stop               |integer |null:false              |

### Association
has_many :notes, through: :note_users
has_many :items
has_many :comments
has_many :note_users

## notes テーブル

|Column          |Type       |Options                 |
|----------------|-----------|------------------------|
|path            |string     |null:false, unique:true |
|password        |string     |null:false              |
|owner           |integer    |null:false              |
|genre_id        |integer    |null:false              |
|list_name       |string     |null:false              |
|log_name        |string     |null:false              |
|reserve_name    |string     |null:false              |
|item_name       |string     |null:false              |

### Association
has_many :users, through: :note_users
has_one :list
has_one :log
has_one :reserve
has_many :comments
has_many :note_users

## note_users テーブル

|Column          |Type       |Options                      |
|----------------|-----------|-----------------------------|
|user            |references |null:false, foreign_key:true |
|note            |references |null:false, foreign_key:true |

### Association
belongs_to :user
belongs_to :note

## items テーブル

|Column          |Type       |Options                      |
|----------------|-----------|-----------------------------|
|name            |string     |null:false                   |
|price           |integer    |null:false                   |
|count_id        |integer    |null:false                   |
|condition       |string     |                             |
|memo            |text       |                             |
|note            |references |null:false, foreign_key:true |
|user            |references |null:false, foreign_key:true |

### Association
belongs_to : user
belongs_to : list
belongs_to : log
belongs_to : reserve

## lists テーブル

|Column       |Type       |Options                      |
|-------------|-----------|-----------------------------|
|room         |references |null:false, foreign_key:true |

### Association
belongs_to :room
has_many :items
has_one :log
has_one :reserve

## logs テーブル

|Column        |Type       |Options                      |
|--------------|-----------|-----------------------------|
|room          |references |null:false, foreign_key:true |
|list          |references |null:false, foreign_key:true |

### Association
belongs_to :room
has_many :items
belongs_to :list

## reserves テーブル

|Column        |Type       |Options                      |
|--------------|-----------|-----------------------------|
|room          |references |null:false, foreign_key:true |
|list          |references |null:false, foreign_key:true |

### Association
belongs_to :room
belongs_to :list

## comments テーブル

|Column        |Type       |Options                      |
|--------------|-----------|-----------------------------|
|content       |text       |null:false                   |
|user          |references |null:false, foreign_key:true |
|room          |references |null:false, foreign_key:true |

### Association
belongs_to :user
belongs_to :room