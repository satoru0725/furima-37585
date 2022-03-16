## usersテーブル

| Column             | Type   | Options                  |
|--------------------|--------|--------------------------|
| email              | string |null: false, unique: true |
| encrypted_password | string |null: false               |
| nickname           | string |null: false               |
| last_name          | string |null: false               |
| first_name         | string |null: false               |
| last_name_kana     | string |null: false               |
| first_name_kana    | string |null: false               |
| birth_date         | date   |null: false               |


### Association

- has_many :items
- has_many :purchase_records


## itemsテーブル

| Column                 | Type       | Options                       |
|------------------------|------------|-------------------------------|
| name                   | string     |null: false                    |
| info                   | text       |null: false                    |
| price                  | integer    |null: false                    |
| category_id            | integer    |null: false                    |
| sales_status_id        | integer    |null: false                    |
| shipping_fee_status_id | integer    |null: false                    |
| prefecture_id          | integer    |null: false                    |
| schedule_delivery_id   | integer    |null: false                    |
| user                   | references |null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :purchase_record


## purchase_recordsテーブル

| Column        | Type       | Options                       |
|---------------|------------|-------------------------------|
| user          | references |null: false, foreign_key: true |
| item          | references |null: false, foreign_key: true |



### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery_address


## delivery_addressesテーブル

| Column          | Type       | Options                       |
|-----------------|------------|-------------------------------|
| postal_code     | string     |null: false                    |
| prefecture_id   | integer    |null: false                    |
| city            | string     |null: false                    |
| addresses       | string     |null: false                    |
| building        | string     |                               |
| phone_number    | string     |null: false                    |
| purchase_record | references |null: false, foreign_key: true |



### Association

- belongs_to :purchase_record