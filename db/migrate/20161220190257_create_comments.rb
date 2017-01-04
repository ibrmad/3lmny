class CreateComments < ActiveRecord::Migration[5.0]
  def change
    drop_table :comments do |t|
      t.text :content
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
  end
end
