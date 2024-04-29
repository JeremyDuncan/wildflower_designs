class UserMailer < ApplicationMailer
  default from: 'jeremy.duncan1984@gmail.com'

  def contact_email(contact)
    @contact = contact
    @greeting = " 👋🏻 Hello Crystal, You have a new message from an interested customer."
    # mail(to: 'wildflowerdesigns0923@gmail.com', cc:'jeremy.duncan1984@gmail.com',subject: 'Wildflower Designs Customer Message')
  end

  def invoice_email(user, cart_items)
    @user = user
    @cart_items = cart_items
    # You can add more variables as needed for the email template
    mail(to: @user.email, bcc: 'jeremy.duncan1984@gmail.com', subject: '🌼Your Invoice from Wildflower Designs')
  end

  def invoice_email_request_to_company(user, cart_items)
    @user = user
    @cart_items = cart_items
    # mail(to: 'wildflowerdesigns0923@gmail.com', bcc: 'jeremy.duncan1984@gmail.com', subject: "🌼Customer Request From: #{@user.first_name} #{@user.last_name}")
  end
end
