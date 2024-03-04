## usersテーブル

| Column              | Type    | Options                  |
| ------------------- | ------- | ------------------------ |
| nickname            | string  | null:false               |
| email               | string  | null:false, unique: true |
| encrypted_password  | string  | null:false               |
| last_name           | string  | null:false               |
| first_name          | string  | null:false               |
| last_name_furigana  | string  | null:false               |
| first_name_furigana | string  | null:false               |
| birth               | date    | null:false               |


### Association
- has_many: items
- has_many: records





## itemsテーブル

| Column             | Type       | Options                  |
| ------------------ | ---------- | ------------------------ |
| item_name          | string     | null:false               |
| explain            | text       | null:false               |
| category_id        | integer    | null:false               |
| situation_id       | integer    | null:false               |
| delivery_charge_id | integer    | null:false               |
| shipping_region_id | integer    | null:false               |
| shipping_days_id   | integer    | null:false               |
| selling_price      | string     | null:false               |
| user               | references | foregin_key: true, null: false        |


### Association
- belongs_to: user
- has_one: record



## recordsテーブル

| Column          | Type       | Options                  |
| --------------- | ---------- | ------------------------ |
| user            | references | foregin_key: true, null: false        |
| item            | references | foregin_key: true, null: false        |

### Association
- belongs_to: user
- belongs_to: item
- has_one: shipping-address





## shipping-addressテーブル

| Column          | Type       | Options                  |
| --------------- | ---------- | ------------------------ |
| post_cord       | string     | null:false               |
| prefecture_id   | integer    | null:false               |
| municipalities  | string     | null:false               |
| street_address  | string     | null:false               |
| building_name   | string     |                          |
| telephon_number | string     | null:false               |
| record          | references | foregin_key: true, null: false        |

### Association
- belongs_to: record



