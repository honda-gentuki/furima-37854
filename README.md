# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| first_name         | string  | null: false               |
| last_name          | string  | null: false               |
| first_name_kana    | string  | null: false               |
| last_name_kana     | string  | null: false               |
| birth_year         | integer | null: false               |
| birth_month        | integer | null: false               |
| birth_day          | integer | null: false               |

### Association

- has_many :items
- has_one :credit_card

## items テーブル

| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| image         | string  | null: false                    |
| name          | string  | null: false                    |
| description   | string  | null: false                    |
| condition     | string  | null: false                    |
| shipping_cost | string  | null: false                    |
| shipping_day  | string  | null: false                    |
| price         | integer | null: false                    |
| user_id       | integer | null: false, foreign_key: true |

### Association

- has_one :shipping_address
- has_one :credit_card
- belongs_to :user

## credit_cards テーブル

| Column           | Type    | Options                        |
| ---------------- | ------- | ------------------------------ |
| card_info        | integer | null: false                    |
| expiration_month | integer | null: false                    |
| expiration_day   | integer | null: false                    |
| security_code    | integer | null: false                    |
| user_id          | integer | null: false, foreign_key: true |
| item_id          | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## shipping_addresses テーブル

| Column         | Type    | Options                        |
| -------------- | ------- | ------------------------------ |
| postal_code    | string  | null: false                    |
| prefecture     | string  | null: false                    |
| city           | string  | null: false                    |
| address        | string  | null: false                    |
| address_line_1 | string  | null: false                    |
| address_line_2 | string  |                                |
| phone_number   | integer | null: false                    |
| item_id        | integer | null: false, foreign_key: true |

### Association

- belongs_to :item
