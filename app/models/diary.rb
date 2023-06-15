class Diary < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :training_part1
  belongs_to :training_part2
  belongs_to :training_part3
  belongs_to :training_part4
  belongs_to :training_part5

  validates :day_date, presence: true
  validates :training_part1_id, presence: true
  validates :training_menu_1, presence: true
  validates :weight_1, presence:true
  validates :times_1, presence:true
  validates :training_diary, presence:true

  validates :training_part1_id, numericality: { other_than: 1, message: "can't be blank" }
end
