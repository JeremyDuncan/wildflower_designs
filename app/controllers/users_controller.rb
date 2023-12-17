class UsersController < ApplicationController
  before_action :authenticate_user!
  include ConsoleColors

  def index
    @users = User.all
  end

  def add_address
    debug(params, "PARAMS")
    # Assign address details to current_user
    current_user.street_name = params[:street_name]
    current_user.city        = params[:city]
    current_user.state       = params[:state]
    current_user.zip_code    = params[:zip_code]
    current_user.save
  end
end

