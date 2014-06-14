class CommentsController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    @comment = Comment.new(params[:comment])
    gift_requests = @comment.gift_request
    respond_to do |format|
      if @comment.save
        format.html { redirect_to gift_requests, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { redirect_to gift_requests, notice: 'Failed to create comment.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def final
    @comment = Comment.find(params[:comment_id])
    if @comment
      @comment_gift_request = @comment.gift_request
      respond_to do |format|
        if current_user.id == @comment_gift_request.user.id && current_user.id != @comment.user.id && @comment.update_attributes(final_answer: true)
          format.html { redirect_to @comment_gift_request, notice: 'Final answer was chosen'}
          format.json { render json: @comment, status: :created}
        else
          format.html { 
            notice = ''
              @comment.errors.full_messages.each do |message|
              notice += message
            end
            unless current_user.id == @comment_gift_request.user.id
              notice += "Unauthorized final answer"
            end
            unless current_user.id != @comment.user.id
              notice += "Can't select your own gift comment as final answer"
            end
            redirect_to @comment_gift_request, notice: notice
          }
          format.json { 
            result = {}
            result[:errors] = @like.errors
            result[:status] = false  
            render json: result
          }       
        end
      end
    end
  end

end

