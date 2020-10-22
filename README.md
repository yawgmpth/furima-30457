# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| --------         | ------ | ----------- |
| nickname         | string | null: false | 
| email            | string | null: false |
| password         | string | null: false |
| first_name       | string | null: false |            
| last_name        | string | null: false |               
| first_name_kana  | string | null: false |                 
| last_name_kana   | string | null: false |            
| birthday 　      | date   | null: false |                
            

### Association
 
- has_many :items
- has_many :orders
- 

## items テーブル

| Column           | Type       | Options     |    
| ------           | ------     | ----------- |
| name             | string     | null: false |
|description       |  text      | null: false |
|category_id       | integer    | null: false |
|condition_id      | integer    | null: false |
|delivery_cost_id  | integer    | null: false |
|delivery_area_id  | integer    | null: false |
|delivery_day_id   | integer    | null: false |
|price             | string     | null: false |
|user_id           | references |null: false, foreign_key: true|
### Association

- belongs_to :orders
- belongs_to :users

##  orders テーブル

| Column   | Type       | Options                        |
| ------   | ---------- | ------------------------------ |
| user_id  | references | null: false, foreign_key: true |
| item_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :user
- belongs_to :addresses

## addresses テーブル

| Column         | Type       | Options                        |
| -------        | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |         
| prefectures_id | integer    | null: false                    |
| city           | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     | null: false                    |
| telephone      | string     | null: false                    |
| item_id        | references | null: false, foreign_key: true |
### Association

- belongs_to :orders
