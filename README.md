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
| password              | | integer | | null: false       |
| password_confirmation | | integer | | null: false       |
| first_name            | | string  | | null: false       |
| family_name           | | string  | | null: false       |
| birthday              | | date    | | null: false       |
| purchase_id           | | integer | | foreign_key: true |
| card_id               | | integer | | foreign_key: true |

### Association

- has_many :products
- has_one :cards
- has_one :purchases

##productsテーブル

| Column               | Type      | Options           |
| -------------------- | --------- | ----------------- |
| image                | binary    | ----------------- |
| item_name            | string    | null: false       |
| description_of_item  | text      | null: false       |
| category             | text      | ----------------- |
| commodity_condition  | timestamp | ----------------- |
| price                | integer   | null: false       |
| user_id              | integer   | foreign_key: true |
| category_id          | string    | foreign_key: true |

### Association

- belongs_to :users
- has_many :purchases

##cardsテーブル

| Column          | | Type     | | Options     |
| --------------- | | -------- | | ----------- |
| card_number     | | integer  | | null: false |
| card_password   | | integer  | | null: false |
| expiration_date | | datetime | | null: false |
| security_code   | | integer  | | null: false |

### Association

- belongs_to :users

###purchasesテーブル

| Column        | | Type      | | Options     |
| ------------- | | --------- | | ----------- |
| postal_code   | | integer   | | null: false |
| prefectures   | | timestamp | | null: false |
| city          | | string    | | null: false |
| address       | | string    | | null: false |
| building_name | | string    | | null: false |
| phone_number  | | integer   | | null: false |

### Association

- belongs_to :users
- belongs_to :products