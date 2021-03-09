## Users
| Column   | Type   | Options                       |
| -------- | ------ | ----------------------------- |
|first_name| string | null:false                    |
| last_name| string | null:false                    |
|first_name_kana| string | null:false               |
|last_name_kana | string | null:false               |
| email    | string | null:false                    |
| tel      | string | null:false                    |

### Association
- has_one  :card
- has_many :orders
- has_one  :address

## Orders
| Column      | Type        | Options                       |
| ----------- | ----------  | ----------------------------- |
| k-name      | string      | null:false                    |
| r-name      | string      | null:false                    |
| birthday    | string      | null:false                    |
| height      | string      | null:false                    |
| user        | references  | null:false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :address

## Cards
| Column       | Type       | Options                       |
| ------------ | ---------- | ----------------------------- |
|card_token    | string     | null:false                    |
|customer_token| string     | null:false                    |
| user         | references | null:false, foreign_key: true |

### Association
- belongs_to :user

## Addresses
| Column   | Type       | Options                       |
| ------   | ---------- | ----------------------------- |
| postcode | integer     | null:false                   |
|prefecture_code| integer     | null:false              |
| city     | string     | null:false                    |
| street   | string     | null:false                    |
| building | string     | null:false                    |
| user     | references | null:false, foreign_key: true |
| order    | references | null:false, foreign_key: true |

### Association
- belongs_to :order
- belongs_to :user
