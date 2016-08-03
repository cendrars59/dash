class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Block access to pages if the user is not authenticated
  # Never delete this line
  before_action :authenticate_user!
end
