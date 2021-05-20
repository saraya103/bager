# アプリケーション名
 **買い物メモアプリ「BAGER（バガー）」**

[![Image from Gyazo](https://i.gyazo.com/dab62d33e6b06e551a8f6c034ae8f425.jpg)](https://gyazo.com/dab62d33e6b06e551a8f6c034ae8f425)
<br><br><br>
Front: 
<img src="https://img.shields.io/badge/-Html5-550000.svg?logo=html5&style=popout">
<img src="https://img.shields.io/badge/-Css3-1572B6.svg?logo=css3&style=popout">
<img src="https://img.shields.io/badge/-Javascript-765.svg?logo=javascript&style=popout">
　Back: 
<img src="https://img.shields.io/badge/-Ruby-CC342D.svg?logo=ruby&style=popout">
<img src="https://img.shields.io/badge/-Rails-CC0000.svg?logo=rails&style=popout"> 
　Database: <img src="https://img.shields.io/badge/-Mysql-4479A1.svg?logo=mysql&style=popout">
<br><br>

# アプリケーション概要
* **リスト機能**
  * 画像添付対応、後から追加も可能
* **マイアイテム機能**
   * よく買うものは簡単操作でリストに登録可能
* **購入履歴機能**
  * いつ・誰が買ったのかが一目瞭然
<br><br>

## （追加実装予定の機能）
* **予約登録機能**
  * 毎日・毎週・毎月買うものは自動でリストに追加
* **ユーザー追加機能**
  * ノートのID/PASSを入力することで他ユーザを追加可能
* **コメント機能**
  * Firebaseを用いてリアルタイムチャットを導入
* **安心のセキュリティ**
  * 自動生成のURL(ID/PASSWORD)
  * 一時停止機能で総当たりのハッキングも安心
<br><br>

# URL
 デプロイが完了次第記載予定です
 <br><br>

## テスト用アカウント
* ID
* PASS
<br><br>

# 利用方法
* **サインアップ**
  * Mailアドレス
  * PASSWORD
  * 氏名（非公開）
  * ニックネーム（公開）<br>
上記を登録することで使用可能になります
* **ノート作成**
  * リスト機能
  * アイテム表
  * 購入履歴
  * 予約欄<br>
これら4つの機能が１セットで利用可能です
<br><br>

# 目指した課題解決
* **「思い出せない」を「一目瞭然」に**<br>
「先週何かを買おうとしてた」<br>
「頼まれてたはずなのに思い出せない」<br>
「この前買ったはずだけど...」<br><br>
日常のちょっとした「痒いところ」に手が届く、<br>
そんなアプリを目指して開発しました。<br>
<br>

* **ビジネスからプライベートまで幅広く活用可能**
  * 子供のおつかいに
  * 旅先でのお土産リストに
  * イベントで分担して買い物をする方に
  * 職場の部署毎の予算見積もりに<br>
<br>
シンプルだからこそ、ちょっとした場面で手が届く、<br>
ニーズの数だけ使い方の正解があるアプリです。<br>
<br>

# 洗い出した要件
<details>
<summary>詳細をクリックして表示</summary>

**ユーザー登録機能** 
* ログインしていない状態だとログイン画面にリダイレクトする
* 適切な情報を入力するとアカウント作成ができる
* 不適切な情報の場合、エラーを表示した上で新規登録画面に戻される
* 作成が完了すると、インデックスページに移行する
* インデックスページではログイン中のユーザ名が表示される
* ログアウトを押すとログイン画面に戻される
* 適切な情報を入力するとログインできる
* 不適切な情報の場合、エラーを表示してログイン画面に戻される<br>

**ノート機能**
* 作成するとリスト・アイテム・ログ・リザーブ機能が使用できる<br>
（以後「各種リスト機能」と記載）
* ノートのオーナー以外はノートの編集・削除を行うことができない
* ノートのオーナー以外でも各種リスト機能は編集・削除できる
* ノートを削除することで、各種リスト機能も削除される<br>

**アイテム機能**
* 名前・価格・個数を記入すれば登録できる<br>
（写真・条件・備考は空欄でも登録が可能）
* 編集を押すことで登録アイテムの修正ができる
* 削除ボタンを押すことで、登録したアイテムが削除される
* 画像が添付されていれば、サムネイルが表示される
* 画像添付がない場合、「NoImage」が表示される<br>

**リスト機能**
* 登録済みアイテムから選択することでリスト追加できる
* 完了を押すことで履歴に登録し、リストから削除される
* 取消を押すとリストから解除される（履歴には登録されない）<br>

**履歴機能**
* リストで完了ボタンを押すと、履歴に登録される
* 登録された履歴には、日時と購入者の情報が追加される
* 履歴は上から順に最新のものが表示される
* 詳細を押すことで履歴の詳細が表示される<br>
<!--
**予約機能**
* 
* 
* 
* <br>

**コメント機能**
* 
* 
* 
* <br>

**招待機能**
* 
* 
* 
* <br>
-->
</details>
<br><br>
<!-- 
# 実装機能についての画像および説明
* 
* 
* 
* 
-->

# データベース設計
## ER図
[![Image from Gyazo](https://i.gyazo.com/dd473902bac66c16051eba4dd1286729.png)](https://gyazo.com/dd473902bac66c16051eba4dd1286729)

<details>
<summary>各モデルの詳細はこちらをクリック</summary>

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
- has_many :notes, through: :note_users
- has_many :items
- has_many :comments
- has_many :note_users
<br><br>

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
- has_many :users, through: :note_users
- has_one :list
- has_one :log
- has_one :reserve
- has_many :comments
- has_many :note_users
<br><br>

## note_users テーブル

|Column          |Type       |Options                      |
|----------------|-----------|-----------------------------|
|user            |references |null:false, foreign_key:true |
|note            |references |null:false, foreign_key:true |

### Association
- belongs_to :user
- belongs_to :note
<br><br>

## items テーブル

|Column          |Type       |Options                      |
|----------------|-----------|-----------------------------|
|name            |string     |null:false                   |
|price           |integer    |null:false                   |
|count           |integer    |null:false                   |
|condition       |string     |                             |
|memo            |text       |                             |
|note            |references |null:false, foreign_key:true |
|user            |references |null:false, foreign_key:true |

### Association
- belongs_to : user
- has_one : list
- has_many : logs
- has_many : reserves
<br><br>

## lists テーブル

|Column       |Type       |Options                      |
|-------------|-----------|-----------------------------|
|note         |references |null:false, foreign_key:true |
|item         |references |null:false, foreign_key:true |

### Association
- belongs_to :note
- belongs_to :item
<br><br>

## logs テーブル

|Column        |Type       |Options                      |
|--------------|-----------|-----------------------------|
|name          |string     |null:false                   |
|price         |integer    |null:false                   |
|count         |integer    |null:false                   |
|condition     |string     |                             |
|memo          |text       |                             |
|buyer         |string     |null:false                   |
|note          |references |null:false, foreign_key:true |
|user          |references |null:false, foreign_key:true |

### Association
- belongs_to :note
- belongs_to :user
<br><br>

## reserves テーブル

|Column        |Type       |Options                      |
|--------------|-----------|-----------------------------|
|date          |date       |null:false                   |
|next_id       |integer    |null:false                   |
|once_id       |integer    |null:false                   |
|note          |references |null:false, foreign_key:true |
|item          |references |null:false, foreign_key:true |

### Association
- belongs_to :note
- belongs_to :item
<br><br>

## comments テーブル

|Column        |Type       |Options                      |
|--------------|-----------|-----------------------------|
|content       |text       |null:false                   |
|user          |references |null:false, foreign_key:true |
|note          |references |null:false, foreign_key:true |

### Association
- belongs_to :user
- belongs_to :note

</details>

<br><br>
# ローカルでの動作方法
- ターミナルを開く
- 「cd ディレクトリ名」で任意のディレクトリに移動
- 「git clone https://github.com/saraya103/gaber.git 」
を実行し、クローニングを行う
- 「cd bager」でディレクトリ内へ移動する
- 「bundle install」を行う
- 「yarn install」を行う
- 「rails db:create」を行う
- 「rails db:migrate」を行う
- 「rails s」でサーバーを起動する
- ブラウザで「http://localhost:3000/ 」へアクセスする
<br><br>
## 開発環境
- OS: macOS 11.3(Big Sur)
- ruby: 2.6.5p114
- Rails: 6.0.3.7
- mySQL: 5.6.51
- git: 2.30.1
