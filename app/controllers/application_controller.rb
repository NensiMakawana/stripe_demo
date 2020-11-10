class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user!

  private
  def after_sign_up_path_for(resource)
    home_path
  end
end
