class UserMailer < ApplicationMailer
  default from: 'jeremy.duncan1984@gmail.com'

  def contact_email(contact)
    @contact = contact
    @greeting = " 👋🏻 Hello Crystal, You have a new message from an interested customer."
    mail(to: 'wildflowerdesigns0923@gmail.com', cc:'jeremy.duncan1984@gmail.com',subject: 'Wildflower Designs Customer Message')
  end

  def invoice_email(user, cart_items)
    @user = user
    @cart_items = cart_items
    # You can add more variables as needed for the email template
    mail(to: @user.email, bcc: 'wildflowerdesigns0923@gmail.com', subject: 'Your Invoice from Wildflower Designs')
  end


end
