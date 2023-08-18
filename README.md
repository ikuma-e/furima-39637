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

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| e-mail             | string | null: false |
| password           | string | null: false |
| description        | text   | null: false |
| family-name        | string | null: false |
| family-name-kana   | string | null: false |
| first-name         | string | null: false |
| first-name-kana    | string | null: false |
| user-birth         | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column            | Type    | Options     |
| -----------       | ------- | ----------- |
| item-name         | string  | null: false |
| price             | integer | null: false |
| category          | string  | null: false |
| description       | string  | null: false |
| state             | string  | null: false |
| delivery-price    | string  | null: false |
| delivery-address  | string  | null: false |
| delivery-time     | string  | null: false |


### Association

- belongs_to : user
- belongs_to : order


## orders テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |
| credit-num | integer    | null: false                    |

### Association

- belongs_to :user
- belongs_to :item

## clients テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| room              | references | null: false, foreign_key: true |
| post-code         | integer    | null: false                    |
| prefecture        | string     | null: false                    |
| city              | string     | null: false                    |
| block             | string     | null: false                    |
| build             |            | null: false                    |
| phone-num         | integer    | null: false                    |

### Association

- belongs_to :order
