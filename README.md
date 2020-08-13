# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

<!-- テーブル設計 -->

##usersテーブル

| Column                | | Type    | | Options           |
| ---------             | | ------- | | ----------------- |
| nickname              | | string  | | null: false       |
| email                 | | string  | | null: false       |
| password              | | string  | | null: false       |
| password_confirmation | | string | | null: false       |
| first_name            | | string  | | null: false       |
| family_name           | | string  | | null: false       |
| birthday              | | date    | | null: false       |
| purchase_id           | | integer | | foreign_key: true |

### Association

- has_many :products
- has_one :purchases
- has_one :product_purchases

##productsテーブル

| Column               | Type      | Options           |
| -------------------- | --------- | ----------------- |
| image                | binary    | null: false       |
| name                 | string    | null: false       |
| description_of_item  | text      | null: false       |
| category             | text      | null: false       |
| commodity_condition  | text      | null: false       |
| price                | integer   | null: false       |
| delivery_fee         | integer   | foreign_key: true |
| exhibitor            | string    | null: false       |
| shipping_area        | string    | null: false       |
| shipping_days        | string    | foreign_key: true |
| user_id              | integer   | foreign_key: true |
| category_id          | string    | foreign_key: true |

### Association

- belongs_to :user
- has_many :purchases
- has_one :product_purchases


###purchasesテーブル

| Column        | | Type      | | Options     |
| ------------- | | --------- | | ----------- |
| city          | | string    | | null: false |
| address       | | string    | | null: false |
| building_name | | string    | | ----------- |
| phone_number  | | string    | | null: false |

### Association

- belongs_to :user
- belongs_to :product
- has_one :product_purchases

###product_purchasesテーブル

| Column      | | Type       | | Options           |
| ----------- | | ---------- | | ----------------- |
| user_id     | | references | | foreign_key: true |
| product_id  | | references | | foreign_key: true |
| purchase_id | | references | | foreign_key: true |

belongs_to :user
belongs_to :product
belongs_to :purchase
