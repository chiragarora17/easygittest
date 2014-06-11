class Comment < ActiveRecord::Base
  attr_accessible :decription, :dislike, :final_answer, :like, :gift_request_id, :user_id

  belongs_to :gift_request
  has_many :likes
end
