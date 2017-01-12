class Users::SessionsController < Devise::SessionsController
  def profile
    @user = User.find_by_username(params[:username])
    @posts = Post.where(user_id: @user).order("created_at DESC").paginate(page: params[:page], per_page: 10)
    @documents = Document.where(user_id: @user).order("created_at DESC").paginate(page: params[:page], per_page: 10)
  end
  def after_sign_in_path_for(resource)
      if current_user.is_admin
        admin_index_path
      else
        super
      end

  end
end
