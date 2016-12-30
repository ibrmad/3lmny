class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.create(comment_params)
    @post = Post.find(params[:post_id])
    @comment.user = current_user
    @comment.post = @post
    if not @post.user == current_user
      Notification.create(recipient: @post.user, actor: current_user, action: "comment on your discussion!", notifiable: @post)
    end
    (@post.users.uniq - [current_user, @post.user]).each do |user|
      Notification.create(recipient: user, actor: current_user, action: "comment on a discussion you comment on!", notifiable: @comment)
    end
    if @comment.save
      redirect_to post_path(@post)
    else
      redirect_to post_path(@post)
    end
  end
  private

  def comment_params
    params[:comment].permit(:content)
  end
end
