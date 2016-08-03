class PagesController < ApplicationController

  # Allow access to pages if the user is not authenticated
   skip_before_action :authenticate_user!

  # method for the homepage when user is not connected
  def home
  end


end
