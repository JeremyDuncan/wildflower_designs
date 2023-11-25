class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def index
    # Admin dashboard code
  end

  private

  def check_admin
    # Redirect to root or another page unless current_user.admin?
    redirect_to(root_path, alert: "You're not authorized to view this page.") unless current_user.admin?
  end
end
