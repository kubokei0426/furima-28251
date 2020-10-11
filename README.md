# テーブル設計

## usersテーブル

| Column             | Type   | Options     |
| --------           | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birth_date         | date   | null: false |

### Association
- has_many :exhibitions
- has_many :purchases

## exhibitionsテーブル

| Column        | Type    | Options                        |
| --------      | ------  | -----------                    |
| image         | text    | null: false                    |
| name          | string  | null: false                    |
| text          | text    | null: false                    |
| price         | integer | null: false                    |
| category_id   | integer | null: false                    |
| status_id     | integer | null: false                    |
| fee_id        | integer | null: false                    |
| prefecture_id | integer | null: false                    |
| delivery_id   | integer | null: false                    |
| user_id       | integer | null: false, foreign_key: true |
| purchaser_id  | integer | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase

## purchasersテーブル

| Column         | Type    | Options                       |
| --------       | ------  | -----------                   |
| exhibition_id  | integer | null: false,foreign_key: true |
| user_id        | integer | null: false,foreign_key: true |
| shipping_id    | integer | null: false,foreign_key: true |

### Association
- belongs_to :user
- belongs_to :exhibition
- has_one :shipping


## shippingsテーブル

| Column        | Type    | Options                         |
| --------      | ------  | -----------                     |
| postal_code   | string  | null: false                     |
| prefecture_id | integer | null: false                     |
| city          | string  | null: false                     |
| addresses     | string  | null: false                     |
| building      | string  |                                 |
| phone_number  | string  | null: false                     |
| purchase_id   | integer | null: false, foreign_key: true  |

### Association
- belongs_to :purchase

