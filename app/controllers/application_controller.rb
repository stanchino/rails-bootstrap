class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { render nothing: true, status: :forbidden }
      format.html { render text: exception.message, status: :forbidden }
    end
  end

  protected
  def authenticate_user_or_admin!
    redirect_to new_user_session_url unless user_signed_in? or admin_signed_in?
  end

  def current_ability
    if admin_signed_in?
      @current_ability ||= Ability.new(current_admin)
    else
      @current_ability ||= Ability.new(current_user)
    end
  end
end
