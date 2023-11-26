# app/controllers/custom_registrations_controller.rb

class CustomRegistrationsController < Devise::RegistrationsController
  before_action :validate_email, only: :create

  private

  # def validate_email
  #   allowed_emails = ['jeremy.duncan1984@gmail.com', 'wildflowerdesigns0923@gmail.com'] # List allowed emails here
  #   unless allowed_emails.include?(params[:user][:email].downcase)
  #     redirect_to new_user_registration_path, alert: "Your email is not authorized to create an account."
  #   end
  # end

  def validate_email
      # redirect_to new_user_registration_path, alert: "Your email is not authorized to create an account."
  end

end
