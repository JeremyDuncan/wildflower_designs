class DeviseMailer < Devise::Mailer
  default from: ENV.fetch("EMAIL_USERNAME", "your_default_email")

  # Reset password instructions
  def reset_password_instructions(record, token, opts={})
    @token = token
    @resource = record
    devise_mail(record, :reset_password_instructions, opts)
  end

  # Email confirmation instructions
  def confirmation_instructions(record, token, opts={})
    @token = token
    @resource = record
    devise_mail(record, :confirmation_instructions, opts)
  end

  # Unlock instructions
  def unlock_instructions(record, token, opts={})
    @token = token
    @resource = record
    devise_mail(record, :unlock_instructions, opts)
  end

  # Email changed notification
  def email_changed(record, opts={})
    @resource = record
    devise_mail(record, :email_changed, opts)
  end

  # Password change notification
  def password_change(record, opts={})
    @resource = record
    devise_mail(record, :password_change, opts)
  end
end
