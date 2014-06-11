class CreateGiftRequests < ActiveRecord::Migration
  def change
    create_table :gift_requests do |t|
      t.integer :user_id
      t.text :description
      t.integer :likes
      t.integer :dislike
      t.boolean :public

      t.timestamps
    end
  end
end
