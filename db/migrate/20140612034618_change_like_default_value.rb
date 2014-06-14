class ChangeLikeDefaultValue < ActiveRecord::Migration
  def up
  	rename_column :gift_requests, :likes, :like_count
  	rename_column :comments, :like, :like_count
  	rename_column :comments, :dislike, :dislike_count  

    rename_column :gift_requests, :dislike, :dislike_count

  	change_column :gift_requests, :like_count, :integer, :default => 0
  	change_column :gift_requests, :dislike_count, :integer, :default => 0

  	change_column :comments, :like_count, :integer, :default => 0
  	change_column :comments, :dislike_count, :integer, :default => 0
  end

  def down
  	rename_column :gift_requests, :like_count, :likes
  	rename_column :comments, :like_count, :like
  	rename_column :comments, :dislike_count, :dislike

  	change_column :gift_requests, :like, :integer, :default => nil
  	change_column :gift_requests, :dislike, :integer, :default => nil

  	change_column :comments, :like, :integer, :default => nil
  	change_column :comments, :dislike, :integer, :default => nil
  end
end
