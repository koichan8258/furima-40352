## usersテーブル

| Column    | Type    | Options                  |
| --------- | ------- | ------------------------ |
| nickname  | string  | null:false               |
| email     | string  | null:false, unique: true |
| password  | string  | null:false               |
| user-name | string  | null:false               |
| furigana  | string  | null:false               |
| birth_id  | integer | null:false               |


### Association
- has_many: items
- has_many: records





## itemsテーブル

| Column             | Type       | Options                  |
| ------------------ | ---------- | ------------------------ |
| item-image         | text       | null:false               |
| item-name          | string     | null:false               |
| explain            | text       | null:false               |
| category_id        | integer    | null:false               |
| situation_id       | integer    | null:false               |
| delivery_id        | integer    | null:false               |
| delivery-charge_id | integer    | null:false               |
| shipping-region_id | integer    | null:false               |
| shipping-days_id   | integer    | null:false               |
| selling-price      | string     | null:false               |
| user_id            | references | foregin_key: true        |


### Association
- belongs_to: users
- has_one: records



## recordsテーブル

| Column          | Type       | Options                  |
| --------------- | ---------- | ------------------------ |
| nickname        | string     | null:false               |
| item-name       | string     | null:false               |
| user_id         | references | foregin_key: true        |
| item_id         | references | foregin_key: true        |

### Association
- belongs_to: users
- belongs_to: items
- has_one: shipping-address





## shipping-addressテーブル

| Column          | Type       | Options                  |
| --------------- | ---------- | ------------------------ |
| post-cord       | string     | null:false               |
| prefecture_id   | integer    | null:false               |
| municipalities  | string     | null:false               |
| street-address  | string     | null:false               |
| building-name   | string     |                          |
| telephon-number | string     | null:false               |
| record_id       | references | foregin_key: true        |

### Association
- belongs_to: records



