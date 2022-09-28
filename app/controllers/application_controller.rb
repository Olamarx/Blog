class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

protected

def configure_permitted_parameters
attrbutes = %i[name email password]
devise_parameter_sanitizer.permit(:sign_up, keys: attrbutes)
end
end
