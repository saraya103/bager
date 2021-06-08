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

# 目次
- [アプリケーション概要](#アプリケーション概要)
  - [（追加実装予定の機能）](#追加実装予定の機能)
- [URL](#url)
- [利用方法](#利用方法)
- [目指した課題解決](#目指した課題解決)
- [洗い出した要件](#洗い出した要件)
- [データベース設計](#データベース設計)
- [ローカルでの動作方法](#ローカルでの動作方法)
  - [開発環境](#開発環境)
<br><br>
# アプリケーション概要
* **リスト機能**
  * 画像添付対応、後から追加も可能
* **マイアイテム機能**
   * よく買うものは簡単操作でリストに登録可能
* **購入履歴機能**
  * いつ・誰が買ったのかが一目瞭然
* **予約登録機能**
  * 毎日・毎週・毎月買うものは自動でリストに追加
  * 定期・不定期・1回限りの3パターンが設定可能
* **ユーザー追加機能**
  * ノートのID/PASSを入力することで他ユーザを追加可能
  * QRコードを読み込むことで登録する事も可能
* **コメント機能**
  * ActionCableを用いたリアルタイムチャットを導入
* **安心のセキュリティ**
  * 自動生成のURL(ID/PASSWORD)
  * 一時停止機能で総当たりのハッキング対策も安心
<br><br>

## （追加実装予定の機能）
* **オーナー譲渡機能**
  * ノート管理者は後から変更・移譲可能
* **チェックボックス機能**
  * 複数のアイテムをまとめて登録・削除を行う
<br><br>

# URL
 http://6ager.com/
 <br><br>
<!--
## BASIC認証
* ID: admin
* PASS: 2105
<br><br>
-->

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

**予約機能**
* リストから選択し、次回追加予定日と繰り返しを指定すると、登録される
* 登録された状態で追加を押すと、その場でリストに登録される
* リストに同じアイテムが存在する場合、登録されない
* 削除を押した場合、予約一覧から削除される
* 次回追加予定日が「未定」の場合、リスト登録後の次回追加日が+1000年される
* 繰り返しが「定期的」の場合、リスト登録後に次回追加日が指定日数分延長される
* 繰り返しが「不定期」の場合、リスト登録後に次回追加予定日が「未定」に変更される
* 繰り返しが「今回限り」の場合、リスト登録後に予約一覧から削除される
* 毎日午前0時に、予約一覧の次回追加日を参照・登録処理を自動で行う<br>

**コメント機能**
* ノート毎にメッセージが発言・保存できる
* メッセージ一覧は上から新しいものが順番に表示される
* 発言を送信すると、読み込みを挟まず一番上に追加される
* メッセージを送信すると、リアルタイムに他の人（画面）にも反映される
* 自身が投稿したメッセージは色付きで表示される
* 当日のメッセージは「時:分:秒」、昨日以前は「月/日 時:分」で表示される<br>

**ノート招待・参加機能**
* ノートのオーナーのみ、ノート詳細ページへ移動する事ができる
* ノートのオーナー以外は、詳細ページに移行せず一覧ページへリダイレクトする
* ログインしていない場合は、ログイン画面へ移行する
* 詳細ページではノートのIDとPASSが表示される
* IDとPASSをパラメータに含んだURLとQRコードも表示される
* 上記URLからアクセスした場合、IDとPASSが入力された状態で登録ページが表示される
* 登録成功した場合、ノートが追加され一覧ページにリダイレクトする
* 登録失敗した場合、ユーザーのカウントが1追加され、エラー文が表示される
* カウントが5に到達すると、ユーザーのストップが1追加されて登録機能が一時停止する
* 毎朝5時に、ユーザーのカウントは0にリセットされる
* ストップが3に到達している場合、登録機能が長期間停止する
* 毎月1日の午前5時に、ユーザーのストップが1以上の場合-1される<br>

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
[![Image from Gyazo](https://i.gyazo.com/4cd8e6e2eeb1a68fa888832bde68eafa.png)](https://gyazo.com/4cd8e6e2eeb1a68fa888832bde68eafa)

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
- has_many :note_users
- has_many :items
- has_many :messages
- has_many :note_users
<br><br>

## notes テーブル

|Column          |Type       |Options                 |
|----------------|-----------|------------------------|
|character       |string     |null:false, unique:true |
|password        |string     |null:false              |
|owner           |integer    |null:false              |
|owner_name      |string     |null:false              |
|title           |string     |null:false              |
|genre_id        |integer    |null:false              |
|list_name       |string     |null:false              |
|log_name        |string     |null:false              |
|reserve_name    |string     |null:false              |
|item_name       |string     |null:false              |

### Association
- has_many :users, through: :note_users
- has_many :note_users
- has_one :list
- has_one :log
- has_one :reserve
- has_many :messages
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

## messages テーブル

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
- 「git clone https://github.com/saraya103/bager.git 」
を実行し、クローニングを行う
- 「cd bager」でディレクトリ内へ移動する
- 「bundle install」を行う
- 「yarn install」を行う
- 「rails db:create」を行う
- 「rails db:migrate」を行う
- 「rails s」でサーバーを起動する
- ブラウザで「http://localhost:3000/ 」へアクセスする
- （定時処理を確認する場合、「bundle exec whenever --update-crontab」<br>
にてcronを起動させる）
<br><br>
## 開発環境
- OS: macOS 11.3(Big Sur)
- ruby: 2.6.5p114
- Rails: 6.0.3.7
- mySQL: 5.6.51
- git: 2.30.1
