class Like < ActiveRecord::Base
  attr_accessible :comment_id, :gift_request_id, :status, :user_id

  belongs_to :user
  belongs_to :gift_request
  belongs_to :comment

  validate :like_cannot_belong_to_post_and_comment
  validates_uniqueness_of :comment_id, :allow_nil => true, :scope => :user_id, :message => "can't be liked more than once"
  validates_uniqueness_of :gift_request_id, :allow_nil => true, :scope => :user_id, :message => "can't be liked more than once"
  validates_presence_of :user_id
  validates_presence_of :status
  validates :status, inclusion: { in: %w(like dislike),
    message: "can only be either like or dislike" }

  def like_cannot_belong_to_post_and_comment
  	if gift_request_id && comment_id
  		errors[:base ] << "Like cannot belong to both a gift request post and a comment"
  	end
  end

  def username
    user.username
  end

  def update_gift_request_or_comment(status, type)
    if type == 'comment'
      if status == 'like'
        new_count = comment_likes + 1
        comment.update_attributes(like_count: new_count)
      else
        new_count = comment_dislikes + 1
        comment.update_attributes(dislike_count: new_count)
      end
    else
      if status == 'like'
        new_count = gift_request_likes + 1
        gift_request.update_attributes(like_count: new_count)
      else
        new_count = gift_request_dislikes + 1
        gift_request.update_attributes(dislike_count: new_count)
      end   
    end
  end

  def update_comment_likes(status)
    if comment
      if status == 'like'
        new_count = comment_likes + 1
        comment.update_attributes(like_count: new_count)
      else
        new_count = comment_dislikes + 1
        comment.update_attributes(dislike_count: new_count)
      end
    end
  end

  def update_gift_request_likes(status)
    if gift_request
      if status == 'like'
        new_count = gift_request_likes + 1
        gift_request.update_attributes(like_count: new_count)
      else
        new_count = gift_request_dislikes + 1
        gift_request.update_attributes(dislike_count: new_count)
      end
    end
  end

  def comment_gift_request
    comment.gift_request
  end

  def comment_likes
    comment.like_count
  end

  def comment_dislikes
    comment.dislike_count
  end

  def gift_request_likes
    gift_request.like_count
  end

  def gift_request_dislikes
    gift_request.dislike_count
  end

end
