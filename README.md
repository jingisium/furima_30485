# テーブル設計

## users テーブル

| Column          | Type   | Options                            |
| --------------- | ------ | ---------------------------------- |
| nickname        | string | null: false                        |
| email           | string | null: false, uniqueness: true      |
| password        | string | null: false, length: { minimum: 6} |
| first_name      | string | null: false                        |
| last_name       | string | null: false                        |
| first_name_kana | string | null: false                        |
| last_name_kana  | string | null: false                        |
| date_of_birth   | date   | null: false                        |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column            | Type       | Options                                       |
| ----------------- | ---------- | --------------------------------------------- |
| title             | string     | null: false                                   |
| description       | text       | null: false                                   |
| category          | integer    | null: false                                   |
| condition         | integer    | null: false                                   |
| delivery_charge   | integer    | null: false                                   |
| send_from         | integer    | null: false                                   |
| days_for_delivery | integer    | null: false                                   |
| price             | integer    | null: false, price >= 300, price <= 9,999,999 |
| user              | references | foreign_key: true                             |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true |
| item    | references | foreign_key: true |

### Association

- belongs_to user
- belongs_to item
- has_one buyer

## buyers テーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| post_code     | string     | null: false       |
| prefecture    | integer    | null: false       |
| city          | string     | null: false       |
| street        | text       | null: false       |
| building      | text       |                   |
| phone         | string     | null: false       |
| purchase      | references | foreign_key: true |

### Association

- belongs_to purchase