class AdminController < ApplicationController
  before_action :authenticate_admin, only: [:index]
  def index
    @documents = Document.where(approved: false)
    @users = User.all.order("RAND()").limit(3)
  end
  def users
    @users = User.all.paginate(page: params[:page], per_page: 20)
  end
end
