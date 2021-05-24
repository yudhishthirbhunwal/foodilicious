class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:home, :help, :about, :contact]
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :first_name, :last_name,
                                                        :phone_number ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :first_name, :last_name,
                                                        :phone_number ])
  end
end
