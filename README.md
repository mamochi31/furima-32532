# テーブル設計

## Usersテーブル

| Column               | Type   | Options                   |
| -------------------- | ------ | ------------------------- |
| nickname             | string | null: false               |
| email                | string | null: false, unique: true |
| encrypted_password   | string | null: false               |
| first_name           | string | null: false               |
| last_name            | string | null: false               |
| pseudonym_first      | string | null: false               |
| pseudonym_last       | string | null: false               |
| birthday             | date   | null: false               |

### Association

- has_many :products
- has_many :buyers

## productsテーブル

| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| price            | integer    | null: false                    |
| text             | text       | null: false                    |
| status_id        | integer    | null: false                    |
| shipping_fee_id  | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| shipment_date_id | integer    | null: false                    |
| category_id      | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :buyer
- belongs_to :status
- belongs_to :shipping_fee
- belongs_to :prefecture
- belongs_to :shipment_date
- belongs_to :category

## buyersテーブル

| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one    :address

## addressesテーブル

| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| buyer         | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer
