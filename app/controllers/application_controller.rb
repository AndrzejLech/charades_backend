class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

acts_as_token_authentication_handler_for User
end
