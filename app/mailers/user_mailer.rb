class UserMailer < ApplicationMailer
  default from: 'jeremy.duncan1984@gmail.com'

  def contact_email(contact)
    @contact = contact
    @greeting = " 👋🏻 Hello Crystal, You have a new message from an interested customer."
    mail(to: 'jeremy.duncan1984@gmail.com', subject: 'Wildflower Designs Customer Message')
  end

  # def contact_email(contact)
  #   @contact = contact
  #   @greeting = " 👋🏻 Hello Crystal, You have a new message from an interested customer."
  #   mail(to: @contact.email, cc: 'jeremy.duncan1984@gmail.com', subject: 'Wildflower Designs Customer Message')
  # end
end
