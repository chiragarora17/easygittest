class GiftRequest < ActiveRecord::Base
  attr_accessible :description, :dislike, :likes, :public, :user_id, :like_count, :dislike_count
  has_many :comments, :dependent => :delete_all
  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :likes, :dependent => :destroy

  validates_presence_of :user_id

  def username
  	user.username
  end
end
