class DashboardController < ApplicationController
  before_action :authenticate_admin!, only: :admin
  before_action :authenticate_user_or_admin!, only: :user
  load_and_authorize_resource :user, parent: false, only: :user, if: :admin_signed_in?

  def index
    respond_to do |format|
      format.html { render }
    end
  end

  def admin
    respond_to do |format|
      format.html { render layout: 'admin' }
    end
  end

  def user
    @user ||= current_user
    respond_to do |format|
      format.html { render layout: 'user' }
    end
  end
end
