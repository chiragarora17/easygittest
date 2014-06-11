class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.string :status
      t.integer :user_id
      t.integer :comment_id
      t.integer :gift_request_id

      t.timestamps
    end
  end
end
