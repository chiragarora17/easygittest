class AddGiftRequestCountToTags < ActiveRecord::Migration
  def change
    add_column :tags, :gift_request_count, :integer
  end
end
