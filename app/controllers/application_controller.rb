# app/controllers/application_controller.rb

class ApplicationController < ActionController::Base
  # other configurations...

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :name, :profile, :occupation, :position])
  end
end
