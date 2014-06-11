class ChangeNullableForTimestampsOnThing1sThing2s < ActiveRecord::Migration
  def up
    change_column(:gift_requests_tags, :created_at, :datetime, :null => true)
    change_column(:gift_requests_tags, :updated_at, :datetime, :null => true)
  end

  def down
    change_column(:gift_requests_tags, :created_at, :datetime, :null => false)
    change_column(:gift_requests_tags, :updated_at, :datetime, :null => false)
  end
end
