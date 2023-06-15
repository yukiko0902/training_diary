# README

# アプリケーション名
貯筋日記

# アプリケーション概要
毎日の筋トレのメニューを記録するアプリケーション
トレーニングした部位をアクティブハッシュで選びトレーニングメニューを記録していく。
日記や写真も投稿できる。
コメント機能やいいね機能等でユーザー同士のコミュニケーションがとれることによって
日々のトレーニングのモチベーションアップにもつながる。

# URL

# 利用方法
## トレーニング記録投稿
1.トップページ（一覧ページ）のヘッダーからユーザー新規登録を行う
2.投稿ボタンから、トレーニング記録（日付・トレーニングメニュー・日記）を入力し投稿する。

## ユーザー同士のコミュニケーションの活性化を図る
1.一覧ページから気になるユーザーの投稿の詳細を確認
2.コメント機能といいね機能で投稿したユーザーを応援する

# アプリケーションを作成した背景

# 洗い出した要件

## users テーブル

| Column                     | Type       | Options                  |
| ---------------------------| -----------| -------------------------|
| nickname                   | string     | null: false              |
| email                      | string     | null: false, unique:true |
| encrypted_password         | string     | null: false              |
| birthday                   | date       | null: false              |
  
### Association

-has_many :diaries
-has_many :comments


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

-belongs_to :user
-has_many :comments


## comments テーブル

| Column                 | Type       | Options                        |
| -----------------------| -----------| -------------------------------|
| comment                | text       | null: false                    |
| user                   | references | null: false, foreign_key: true |
| diary                  | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-belongs_to :diary
