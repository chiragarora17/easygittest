class RenameCommentPost < ActiveRecord::Migration
  def up
  	rename_column :comments, :post_id, :gift_request_id
  end

  def down
   	rename_column :comments, :gift_request_id, :post_id 	
  end
end
