class UserMailer < ApplicationMailer
  default from: 'jeremy.duncan1984@gmail.com'

  def contact_email(contact)
    @contact = contact
    mail(to: @contact.email, cc: 'jeremy.duncan1984@gmail.com', subject: 'Thank you for your message')
  end
end
