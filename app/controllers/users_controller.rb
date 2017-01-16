class UsersController < ApplicationController

  before_action :authenticate_user!

  def edit_password
    @user = current_user
  end

  def update_password
    @user = User.find(current_user.id)
    if @user.update_with_password(user_params)
      # Sign in the user by passing validation in case their password changed
      bypass_sign_in(@user)
      redirect_to root_path, notice: "password has been changed successfully!"
    else
      render :edit_password
    end
  end
  def destroy
    @user = User.find(params[:id])
    @user.delete
    if @user.delete  
      redirect_to admin_index_path, notice: "user has been deleted successfully!"
    end
  end
  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :current_password)
  end
end
