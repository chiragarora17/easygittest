class RenameDescription < ActiveRecord::Migration
  def up
  	rename_column :comments, :decription, :description 
  end

  def down
  	rename_column :comments, :description, :decription
  end
end
