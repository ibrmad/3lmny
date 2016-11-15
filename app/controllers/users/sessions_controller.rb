class Users::SessionsController < Devise::SessionsController
  def profile
    @user = User.find_by_username(params[:username])
  end
end
