class CreateGiftRequestTagsJoinTable < ActiveRecord::Migration
  def change
    create_table :gift_requests_tags do |t|
      t.integer :gift_request_id
      t.integer :tag_id

      t.timestamps
    end
    add_index :gift_requests_tags, [:gift_request_id, :tag_id], unique: true
  end
end
