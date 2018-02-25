class CommentsController < ApplicationController
  def index
    @comments = Comment.all

    render json: @comments.as_json
  end

  def show
    @comments = Comment.where(commentable_id: params[:id])

    render json: @comments.as_json
  end

  def create
    @comment = Comment.new(
                            user_id: current_user.id,
                            commentable_id: params[:commentable_id],   #ask Josh polymorphic
                            commentable_type: 0,   #ask Josh polymorphic
                            text: params[:text]
                          )
    if @comment.save
     render json: @comment.as_json
    else
      render json: {errors: @comment.errors.full_messages}, status: :unprocessable_entity
    end
  end

end
