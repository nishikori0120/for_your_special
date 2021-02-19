## Users
| Column   | Type   | Options                       |
| -------- | ------ | ----------------------------- |
| name     | string | null:false                    |
| email    | string | null:false                    |
| tel      | string | null:false                    |
| postcode | string | null:false                    |
|prefecture| string | null:false                    |
| city     | string | null:false                    |
| street   | string | null:false                    |
| building | string | null:false                    |

### Association
- has_one  :card
- has_many :orders

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
| postcode | string     | null:false                    |
|prefecture| string     | null:false                    |
| city     | string     | null:false                    |
| street   | string     | null:false                    |
| building | string     | null:false                    |
| user     | references | null:false, foreign_key: true |
| order    | references | null:false, foreign_key: true |

### Association
- belongs_to :order
