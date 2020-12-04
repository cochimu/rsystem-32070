# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :reservations

## reservations テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| customer_name | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- has_many :staffs, through: reservation_staffs
- has_many :purposes, through: reservation_purposes
- has_many :items, through: reservation_items
- belongs_to :user

## reservation_staffs テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| reservation | references | null: false, foreign_key: true |
| staff       | references | null: false, foreign_key: true |

### Association

- belongs_to :reservation
- belongs_to :staff

## staffs テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :reservation_staffs
- has_many :reservations, through: reservation_staffs

## reservation_purposes テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| reservation | references | null: false, foreign_key: true |
| purpose     | references | null: false, foreign_key: true |

### Association

- belongs_to :reservation
- belongs_to :purpose

## purposes テーブル

| Column  | Type   | Options     |
| ------- | ------ | ----------- |
| content | string | null: false |

### Association

- has_many :reservation_purposes
- has_many :reservations, through: reservation_purposes

# reservation_items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| reservation | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :reservation
- belongs_to :item

## items テーブル

| Column  | Type   | Options     |
| ------- | ------ | ----------- |
| content | string | null: false |

### Association

- has_many :reservation_items
- has_many :reservations, through: reservation_items