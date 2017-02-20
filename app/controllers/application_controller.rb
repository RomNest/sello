class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_order

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

	protected

	def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  	devise_parameter_sanitizer.permit(:account_update, keys: [:name])
	end
end
