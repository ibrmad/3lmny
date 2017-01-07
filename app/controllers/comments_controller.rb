class CommentsController < ApplicationController
  before_action :find_commentable
  before_action :authenticate_user!

  def create
    @comment = @commentable.comments.new comment_params
    @comment.user = current_user
    if @commentable === Post
      if not @commentable.user == current_user
        Notification.create(recipient: @commentable.user, actor: current_user, action: "comment on your discussion!", notifiable: @commentable)
      end
      (@commentable.users.uniq - [current_user, @commentable.user]).each do |user|
        Notification.create(recipient: user, actor: current_user, action: "comment on a discussion you comment on!", notifiable: @comment)
      end
    end
    if @comment.save
      redirect_to :back, notice: 'Comment was successfully created.'
    else
      redirect_to :back, alert: 'Something went wrong!'
    end
  end
  private

  def comment_params
    params[:comment].permit(:content)
  end
  def find_commentable
    @commentable = Post.find_by_id(params[:post_id]) if params[:post_id]
    @commentable = Video.find_by_id(params[:video_id]) if params[:video_id]
  end
end
