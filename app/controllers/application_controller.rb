class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  
  protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me, :role, :points, :current_password, :avatar) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:password, :password_confirmation, :username, :email, :points, :role, :public, :current_password, :avatar, :public_profile, :public_sleep_log) }
    end
end
