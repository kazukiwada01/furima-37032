# テーブル設計

## users テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| last_name_kana     | string     | null: false                    |
| birthday           | date       | null: false                    |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| item_description   | text       | null: false                    |
| category           | string     | null: false                    |
| status             | string     | null: false                    |
| delivery_fee       | string     | null: false                    |
| ship_from          | string     | null: false                    |
| ship_days          | string     | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :purchase

## purchases テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |
| address            | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | integer    | null: false                    |
| prefectures        | string     | null: false                    |
| city_name          | string     | null: false                    |
| street             | string     | null: false                    |
| building_name      | string     | null: false                    |
| phone_number       | integer    | null: false                    |
| purchase           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :purchase