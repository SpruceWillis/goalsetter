class CommentsController < ApplicationController

  def create
    klass = [Goal, User].detect{|c| params["#{c.name.underscore}_id"]}
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.commentable_id = params["#{klass.name.underscore}_id"]
    @comment.commentable_type = klass.to_s
    if @comment.save
      redirect_to :back
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy!
    redirect_to :back
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
