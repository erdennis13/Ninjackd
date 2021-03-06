class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	before_filter :configure_permitted_parameters, if: :devise_controller?

	protected
	 def configure_permitted_parameters
	   devise_parameter_sanitizer.for(:sign_up) << :name
	   devise_parameter_sanitizer.for(:account_update) << :name
	   devise_parameter_sanitizer.for(:sign_up) << :admin
	   devise_parameter_sanitizer.for(:account_update) << :admin
	   devise_parameter_sanitizer.for(:sign_up) << :username
	   devise_parameter_sanitizer.for(:account_update) << :username
	   devise_parameter_sanitizer.for(:sign_up) << :paypal_payment_token
	   devise_parameter_sanitizer.for(:sign_up) << :paypal_customer_token
	   devise_parameter_sanitizer.for(:sign_up) << :paypal_recurring_profile
	   devise_parameter_sanitizer.for(:sign_up) << :numweeks
	   devise_parameter_sanitizer.for(:account_update) << :numweeks
	 end

end
