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

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| e_mail             | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name         | string | null: false               |
| first_name_kana    | string | null: false               |
| user_birth         | date   | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column              | Type        | Options                       |
| ------------------- | ----------- | ----------------------------- |
| item_name           | string      | null: false                   |
| description         | text        | null: false                   |
| price               | integer     | null: false                   |
| category_id         | integer     | null: false                   |
| state_id            | integer     | null: false                   |
| delivery_price_id   | integer     | null: false                   | 
| delivery_address_id | integer     | null: false                   | 
| delivery_time_id    | integer     | null: false                   |
| user                | references  | null: false, foreign_key: true|



### Association

- belongs_to : user
- has_one    : order


## orders テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |
| credit_num | integer    | null: false                    |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :client

## clients テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| order               | references | null: false, foreign_key: true |
| post-code           | string     | null: false                    |
| delivery_address_id | string     | null: false                    |
| city                | string     | null: false                    |
| block               | string     | null: false                    |
| build               | string     |                                |
| phone_num           | string     | null: false                    |

### Association

- belongs_to :order
