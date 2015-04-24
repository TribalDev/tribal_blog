class ApplicationController < ActionController::Base
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError do |exception|
    redirect_to root_url, alert: exception.message
  end

  protected
  def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) << :name
  end

end
