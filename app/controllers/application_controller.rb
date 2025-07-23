class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit::Authorization

  after_action :maybe_verify_authorized, unless: :skip_pundit?
  after_action :maybe_verify_policy_scoped, unless: :skip_pundit?

  protected

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  private

  def maybe_verify_authorized
    verify_authorized unless action_name == 'index'
  end

  def maybe_verify_policy_scoped
    verify_policy_scoped if action_name == 'index'
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
