class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_sign_up_params, if: :devise_controller?
  before_filter :set_search
  
   protected
   
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
  
  def set_search
    @q=Recipe.search(params[:q])
  end
  
end
