# README

# アプリケーション名
貯筋日記

# アプリケーション概要
毎日の筋トレのメニューを記録するアプリケーション<br>
トレーニングした部位をアクティブハッシュで選びトレーニングメニューを記録していく。<br>
日記や写真も投稿できる。<br>
コメント機能やいいね機能等でユーザー同士のコミュニケーションがとれることによって<br>
日々のトレーニングのモチベーションアップにもつながる。<br>

# URL
https://training-diary-38951.onrender.com <br>

# 利用方法

## トレーニング記録投稿
1.トップページ（一覧ページ）のヘッダーからユーザー新規登録を行う<br>
2.投稿ボタンから、トレーニング記録（日付・トレーニングメニュー・日記）を入力し投稿する。<br>

## ユーザー同士のコミュニケーションの活性化を図る
1.一覧ページから気になるユーザーの投稿の詳細を確認<br>
2.コメント機能といいね機能で投稿したユーザーを応援する<br>

# アプリケーションを作成した背景
  ジムに通っているが、なかかモチベーションが上がらずサボってしまうときがある。<br>
  他ユーザーの投稿をみてモチベーションUPできるアプリがあればいいなと思った。<br>

## users テーブル

| Column                     | Type       | Options                  |
| ---------------------------| -----------| -------------------------|
| nickname                   | string     | null: false              |
| email                      | string     | null: false, unique:true |
| encrypted_password         | string     | null: false              |
| birthday                   | date       | null: false              |
  
### Association

-has_many :diaries<br>
-has_many :comments<br>


## diaries テーブル 

| Column                 | Type       | Options                        |
| -----------------------| -----------| -------------------------------|
| day_date               | date       | null: false                    |
| training_part1_id      | integer    | null: false                    |
| training_menu_1        | text       | null: false                    |
| weight_1               | integer    | null: false                    |
| times_1                | integer    | null: false                    |
| training_part2_id      | integer    |                                |
| training_menu_2        | text       |                                |
| weight _2              | integer    |                                |
| times_2                | integer    |                                |
| training_part3_id      | integer    |                                |
| training_menu_3        | text       |                                |
| weight _3              | integer    |                                |
| times_3                | integer    |                                |
| training_part4_id      | integer    |                                |
| training_menu_4        | text       |                                |
| weight _4              | integer    |                                |
| times_4                | integer    |                                |
| training_part5_id      | integer    |                                |
| training_menu_5        | text       |                                |
| weight _5              | integer    |                                |
| times_5                | integer    |                                |
| training_diary         | text       | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

-belongs_to :user<br>
-has_many :comments<br>


## comments テーブル

| Column                 | Type       | Options                        |
| -----------------------| -----------| -------------------------------|
| comment                | text       | null: false                    |
| user                   | references | null: false, foreign_key: true |
| diary                  | references | null: false, foreign_key: true |

### Association

-belongs_to :user<br>
-belongs_to :diary<br>

## likes テーブル

### Association

belongs_to :user<br>
belongs_to :diary<br>

## relationshios テーブル

### Association
belongs_to :following, class_name: "User" <br>
belongs_to :follower, class_name: "User" <br>

has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id <br>
has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id <br>
 
has_many :followings, through: :active_relationships, source: :follower <br>
has_many :followers, through: :passive_relationships, source: :following <br>