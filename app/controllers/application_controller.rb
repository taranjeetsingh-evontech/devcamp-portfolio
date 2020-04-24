class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Special devise parameter whitelist method
  # before_filter :configure_permitted_parameters, if: :devise_controller?   This is removed in Rails 5.1 
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
  	#This is specific to Rails 5
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  	devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
