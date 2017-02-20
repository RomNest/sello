class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_cart
  before_action :init_cart
  before_filter :configure_permitted_parameters, if: :devise_controller?
  private

    def current_cart 
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end

    def init_cart
      @cart = current_cart
    end

	protected

	def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  	devise_parameter_sanitizer.permit(:account_update, keys: [:name])
	end
end
