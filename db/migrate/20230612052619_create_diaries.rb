class CreateDiaries < ActiveRecord::Migration[6.0]
  def change
    create_table :diaries do |t|
      t.date    :day_date
      t.integer :training_part1_id
      t.text    :training_menu_1
      t.integer :weight_1
      t.integer :times_1 
      t.integer :training_part2_id
      t.text    :training_menu_2
      t.integer :weight_2
      t.integer :times_2
      t.integer :training_part3_id
      t.text    :training_menu_3
      t.integer :weight_3
      t.integer :times_3
      t.integer :training_part4_id
      t.text    :training_menu_4
      t.integer :weight_4
      t.integer :times_4
      t.integer :training_part5_id
      t.text    :training_menu_5
      t.integer :weight_5
      t.integer :times_5 
      t.text    :training_diary 
      t.references :user 
      t.timestamps
    end
  end
end
