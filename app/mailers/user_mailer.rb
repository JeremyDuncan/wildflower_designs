class UserMailer < ApplicationMailer
  default from: ENV.fetch("EMAIL_USERNAME", "your_default_email")

  def contact_email(contact)
    @contact = contact
    @greeting = " 👋🏻 Hello Crystal, You have a new message from an interested customer."
    # mail(to: 'wildflowerdesigns0923@gmail.com', cc:ENV.fetch("EMAIL_USERNAME", "your_default_email"), subject: 'Wildflower Designs Customer Message')
  end

  def invoice_email(user, cart_items)
    @user = user
    @cart_items = cart_items
    # You can add more variables as needed for the email template
    mail(to: @user.email, bcc: ENV.fetch("EMAIL_USERNAME", "your_default_email"), subject: '🌼Your Invoice from Wildflower Designs')
  end

  def invoice_email_request_to_company(user, cart_items)
    @user = user
    @cart_items = cart_items
    # mail(to: 'wildflowerdesigns0923@gmail.com', bcc: ENV.fetch("EMAIL_USERNAME", "your_default_email"), subject: "🌼Customer Request From: #{@user.first_name} #{@user.last_name}")
  end
end
