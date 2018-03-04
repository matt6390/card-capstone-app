class CommentsController < ApplicationController
  def index
    @comments = Comment.all
    search_term = params[:search]

    if search_term
      @comments = @comments.where("commentable_id = ?", "#{search_term}")
    end


    render 'index.json.jbuilder'
  end

  def show
    @comment = Comment.where(commentable_id: params[:id])

    render 'show.json.jbuilder'
  end

  def create
    @comment = Comment.new(
                            user_id: current_user.id,
                            commentable_id: params[:commentable_id],   #ask Josh polymorphic
                            commentable_type: 0,   #ask Josh polymorphic
                            text: params[:text]
                          )
    if @comment.save
     render 'show.json.jbuilder'
    else
      render json: {errors: @comment.errors.full_messages}, status: :unprocessable_entity
    end
  end

end
