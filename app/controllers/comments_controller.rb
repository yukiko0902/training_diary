class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to diary_path(@comment.diary)
    else
      @diary = @comment.prototype
      @comments = @diary.comments
      render "prototypes/show"
    end  
  end

private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, diary_id: params[:diary_id])
  end
end
