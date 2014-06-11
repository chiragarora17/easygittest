class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :post_id
      t.text :decription
      t.integer :like
      t.integer :dislike
      t.boolean :final_answer

      t.timestamps
    end
  end
end
