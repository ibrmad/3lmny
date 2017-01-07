class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters
  before_action :authenticate_admin, only: [:index]

  def index
    @users = User.all.paginate(page: params[:page], per_page: 20)
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
      devise_parameter_sanitizer.permit(:account_update, keys: [:image, :first_name, :last_name, :bio, :gender])
    end
end
