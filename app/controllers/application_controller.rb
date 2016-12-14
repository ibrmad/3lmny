class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def authenticate_admin
    redirect_to '/', alert: 'Not authorized.' unless current_user.present? && current_user.is_admin
  end
end
