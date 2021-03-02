# テーブル設計

## users テーブル

| Column               | Type    | Options                  |
| -------------------- | ------- | ----------               |
| nickname             | string  | null:false               |
| email                | string  | null:false, unique: true |
| encrypted_password   | string  | null:false               |
| family_name          | string  | null:false               |
| first_name           | string  | null:false               |
| family_name_ruby     | string  | null:false               |
| first_name_ruby      | string  | null:false               |
| birth                | date    | null:false               |


### Association

- has_many :items
- has_mani :orders

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null:false                     |
| text        | text       | null:false                     |
| category_id | integer    | null:false                     |
| status_id   | integer    | null:false                     |
| payment_id  | integer    | null:false                     |
| area_id     | integer    | null:false                     |
| days_id     | integer    | null:false                     |
| price       | integer    | null:false                     |
| user_id     | references | null :false, foreign_key: true |


### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :send_order

## send_orders テーブル

| Column       | Type       | Options                       |
| ------------ | ---------- | ----------------------------- |
| postal_code  | string     | null:false                    |
| area_id      | integer    | null:false                    |
| city         | string     | null:false                    |
| address      | string     | null:false                    |
| building     | string     |                               |
| phone_number | string     | null:false                    |
| order_id     | references | null:false, foreign_key: true |

### Association

- belongs_to :order