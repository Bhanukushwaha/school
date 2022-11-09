class CommentsController < ApplicationController
  def create
    @friend = Friend.find(params[:friend_id])
    @comment = @friend.comments.create(title: params[:title])
    redirect_to friend_path(@friend)
  end

  def remove
  	@comment = Comment.find(params[:id])
  	@comment.destroy
  	redirect_to friends_path
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :title)
    end
end
