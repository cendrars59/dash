class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Block access to pages if the user is not authenticated
  # Never delete this line
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:alias])
  end

end
