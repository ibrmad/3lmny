class Users::SessionsController < Devise::SessionsController
  def profile
    @user = User.find_by_username(params[:username])
    @posts = Post.where(user_id: @user).order("created_at DESC").paginate(page: params[:page], per_page: 10)
    @documents = Document.where(user_id: @user).order("created_at DESC").paginate(page: params[:page], per_page: 10)
  end

end
