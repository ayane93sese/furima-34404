# テーブル設計

## users テーブル

| Column        | Type    | Options    |
| ------------- | ------- | ---------- |
| nickname      | string  | null:false |
| email         | string  | null:false |
| password      | string  | null:false |
| name          | string  | null:false |
| birth_year    | integer | null:false |
| birth_month   | integer | null:false |
| birth_day     | integer | null:false |

### Association

- has_many :items
- has_mani :orders

## items テーブル

| Column      | Type    | Options    |
| ----------- | ------- | ---------- |
| title       | string  | null:false |
| text        | text    | null:false |
| category_id | integer | null:false |
| status_id   | integer | null:false |
| payment_id  | integer | null:false |
| area_id     | integer | null:false |
| days        | integer | null:false |
| price       | integer | null:false |


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

| Column       | Type    | Options    |
| ------------ | ------- | ---------- |
| postal_code  | integer | null:false |
| prefecture   | integer | null:false |
| city         | string  | null:false |
| address      | string  | null:false |
| building     | string  |            |
| phone_number | integer | null:false |

### Association

- belongs_to :order