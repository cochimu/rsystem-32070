## 内容

## アプリケーション名
- Rsystem

## アプリケーション概要
- 店舗側がお客様の予約内容を管理できる

## URL
- https://rsystem-32070.herokuapp.com/

## テスト用アカウント
- ユーザー名:テスト
- メールアドレス:sample1@sample
- パスワード:sample1

## Basic認証
- 

## 利用方法
- ログインすると、スタッフ名、提案項目、手続き内容の登録ができる。
登録をすることで予約作成画面でプルダウンで選択することができる。
新規作成をクリックすると予約作成画面に遷移するので、入力していく。
縦のレーンは増やしたり減らしたりできるので現場に合わせて利用する。

## 目指した課題解決
- 予約制度を導入している店舗のお客様管理、スタッフ管理をを楽にしたかった。
また、保存しておけるので、結果がよかった時と悪かった時の比較や振り返りもしやすい。
紙で保存しておくよりも記入も少なく

## 洗い出した要件
- ユーザー管理機能
ユーザーごとに表示する内容を変えることができる

- 項目ごと（スタッフ名、提案項目、手続き内容）の登録ページ作成
店舗ごとに必要な内容に合わせて使えるようにする

- 予約一覧ページ作成
時間ごとに入力する。スタッフ名、提案項目、手続き内容は保存した内容をプルダウンで選択できる

- 使いやすくシンプルなビュー
仕事で使うことを想定している為シンプルに、かつ分かりやすいアクションをつける

## 実装した機能について
- スタッフ登録、提案項目、手続き項目はあらかじめ決めておくのではなく店舗ごとに必要なものを記入できるようにした。
予約の縦のレーンは店舗の規模により変更できるようにした。
登録したデータはログインユーザーのものしか表示されないので安心。

## 実装予定の機能
- 

## ローカルでの操作方法
  % git clone https://github.com/cochimu/rsystem-32070.git
  % cd rsystem-32070
  % bundle install
  % rails db:create
  % rails db:migrate


# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :reservations
- has_many :staffs
- has_many :purposes
- has_many :items
- has_one :cover

## reservations テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| customer_name | string     | null: false                    |
| memo          | string     | null: false                    |
| day           | date       | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- has_many :staffs, through: reservation_staffs
- has_many :purposes, through: reservation_purposes
- has_many :items, through: reservation_items
- belongs_to :user
- has_one :cover

## reservation_staffs テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| reservation | references | null: false, foreign_key: true |
| staff       | references | null: false, foreign_key: true |

### Association

- belongs_to :reservation
- belongs_to :staff

## staffs テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| name   | string     | null: false                    |
| user   | references | null: false, foreign_key: true |

### Association

- has_many :reservation_staffs
- has_many :reservations, through: reservation_staffs
- belongs_to :user

## reservation_purposes テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| reservation | references | null: false, foreign_key: true |
| purpose     | references | null: false, foreign_key: true |

### Association

- belongs_to :reservation
- belongs_to :purpose

## purposes テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     | null: false                    |
| user    | references | null: false, foreign_key: true |

### Association

- has_many :reservation_purposes
- has_many :reservations, through: reservation_purposes
- belongs_to :user

# reservation_items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| reservation | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :reservation
- belongs_to :item

## items テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     | null: false                    |
| user    | references | null: false, foreign_key: true |

### Association

- has_many :reservation_items
- has_many :reservations, through: reservation_items
- belongs_to :user

## covers テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| reservation | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :reservation
- belongs_to :user