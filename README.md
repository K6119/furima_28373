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
| password_confirmation | | string  | | null: false       |
| first_name            | | string  | | null: false       |
| family_name           | | string  | | null: false       |
| first_kana            | | string  | | null: false       |
| family_kana           | | string  | | null: false       |
| birthday              | | date    | | null: false       |

### Association

- has_many :purchases
- has_many :items

##itemsテーブル

| Column               | Type      | Options           |
| -------------------- | --------- | ----------------- |
| name                 | string    | null: false       |
| image                | binary    | null: false       |
| item_description     | text      | null: false       |
| item_condition       | integer   | null: false       |
| category             | integer   | null: false       |
| delivery_fee         | integer   | null: false       |
| price                | integer   | null: false       |
| shipping_area        | integer   | null: false       |
| shipping_days        | integer   | null: false       |
| user_id              | integer   | foreign_key: true |

### Association

- has_one :purchase
- belongs_to :user

###addressesテーブル

| Column        | | Type       | | Options           |
| ------------- | | ---------- | | ----------------- |
| postal_code   | | string     | | null: false       |
| address       | | string     | | null: false       |
| prefectures   | | integer    | | null: false       |
| city          | | string     | | null: false       |
| building_name | | string     | | ----------------- |
| phone_number  | | string     | | null: false       |

### Association

- belongs_to :purchase

###purchasesテーブル

| Column         | | Type       | | Options           |
| -------------- | | ---------- | | ----------------- |
| user           | | references | | foreign_key: true |
| item           | | references | | foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address