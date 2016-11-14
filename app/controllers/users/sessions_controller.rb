class Users::SessionsController < Devise::SessionsController
  def profile
    @user = User.find_by_username(params[:username])
    @posts = Post.where(user_id: @user).order("created_at DESC")
  end
  def user_posts
    @posts = Post.where(user_id: @user).order("created_at DESC")
  end
end
