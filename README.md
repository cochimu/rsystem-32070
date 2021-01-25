## アプリケーション名
- Rsystem

## アプリケーション概要
- 店舗側がお客様の予約内容を管理できる

## URL
- http://52.197.83.13/

## 画面イメージ
<img width="1438" alt="スクリーンショット 2021-01-26 0 04 14" src="https://user-images.githubusercontent.com/73867134/105723691-6aecad80-5f6a-11eb-93e8-744f8365134e.png">

<img width="1440" alt="スクリーンショット 2021-01-26 0 05 15" src="https://user-images.githubusercontent.com/73867134/105723971-b69f5700-5f6a-11eb-8722-3cea97ec60a9.png">

<img width="1440" alt="スクリーンショット 2021-01-26 0 06 00" src="https://user-images.githubusercontent.com/73867134/105723994-bc953800-5f6a-11eb-9231-0098105f13b0.png">

## テスト用アカウント
- ユーザー名:テスト
- メールアドレス:sample1@sample
- パスワード:sample1

## 使用技術
- フロントエンド
HTML/CSS/JavaScript

- バックエンド
Ruby on Rails 6.0

- インフラ
AWS(EC2,IAM)/mysql

## 利用方法
- ログインすると、スタッフ名、提案項目、手続き内容の登録ができる
- スタッフ名、提案項目、手続き内容を登録をすることで予約作成画面でプルダウンで選択することができる
- 「新規作成」をクリックすると予約作成画面に遷移し入力ができる
- レーンは数は増やしたり減らしたりできるので現場に合わせて使うことができる

## 目指した課題解決
- 前職でドコモショップのフロアマネージャーや店舗実績管理をしていた経験から、簡単に予約管理と予約したお客様の情報を見るためのツールを作成。
お客様情報があることで、スタッフとお客様との適切なマッチング、実績向上に繋がり、フロアマネージャーも迅速な判断と指示ができる。
- 今回は携帯ショップ用になっているが項目を変えれば飲食店などでも使える

## 洗い出した要件
- ユーザー管理機能
ユーザーごとに表示する内容を変えることができる（スタッフ名、提案項目、手続き内容）

- 項目ごと（スタッフ名、提案項目、手続き内容）の登録ページ作成
店舗ごとに必要な内容に編集することができる

- 予約一覧ページ作成
スタッフ名、提案項目、手続き内容は保存した内容をプルダウンで選択できる

- 使いやすくシンプルなビュー
仕事で使うことを想定している為シンプルに、かつ分かりやすいアクションをつける

## 実装した機能について
- スタッフ登録、提案項目、手続き項目は店舗ごとに必要なものに編集できるようにした
- 予約のレーン数は店舗の規模により変更できるようにした
- 登録したデータはログインユーザーのものしか表示されないので安心

## 実装予定の機能
- 保存した予約内容を見ることで過去の振り返りができる為,入力フォームの内容を一括で保存できるようにしたい
(現在は保存しても最後に入力した内容のみ表示される状態)


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
