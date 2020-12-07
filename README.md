# テーブル設計

## Usersテーブル

| Column               | Type   | Options                   |
| -------------------- | ------ | ------------------------- |
| nickname             | string | null: false               |
| email                | string | null: false, unique: true |
| encrypted_password   | string | null: false               |
| first_name           | string | null: false               |
| last_name            | string | null: false               |
| first_name_pseudonym | string | null: false               |
| last_name_pseudonym  | string | null: false               |
| birthday             | date   | null: false               |

### Association

- has_many :products
- has_many :buyers

## productsテーブル

| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| price         | string     | null: false                    |
| text          | text       | null: false                    |
| status        | integer    | null: false                    |
| shipping_fee  | integer    | null: false                    |
| prefecture    | integer    | null: false                    |
| shipment_date | integer    | null: false                    |
| category      | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :buyers

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

| Column       | Type       | Option                         |
| ------------ | ---------- | ------------------------------ |
| postal_code  | integer    | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     |                                |
| phone_number | string     | null: false                    |
| buyer        | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer
