class AddTitleToGiftRequest < ActiveRecord::Migration
  def change
    add_column :gift_requests, :title, :string
  end
end
