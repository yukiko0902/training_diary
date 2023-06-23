class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.comment
      t.text :content
      t.references :user,:diary, null:false, foregin_key: true
      t.timestamps
    end
  end
end
