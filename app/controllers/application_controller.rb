class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit::Authorization

  after_action :maybe_verify_authorized, unless: :skip_pundit?
  after_action :maybe_verify_policy_scoped, unless: :skip_pundit?

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
