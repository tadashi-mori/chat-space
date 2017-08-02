## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|body|text|null: false|
|image|string||
|group_id|integer|null: false, foreign_key: true|
|user_id|integer|null:false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|text|index: true, null: false, unique: true|
|e-mail|text|index: true, null: false, unique: true|

### Association
- has_many :messages
- has_many :groups, through: :gruop_users
- has_many :group_users

## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|text|index: true, null: false|

### Association
- has_many :users, though: :gruop_users
- has_many :group_users
- has_many :massages

## group_usersテーブル
|Column|Type|Options|
|------|----|-------|
|group_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group

