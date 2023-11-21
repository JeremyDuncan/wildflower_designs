class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      UserMailer.contact_email(@contact).deliver_now

      redirect_to new_contact_path, notice: "Your message was sent!"
    else
      redirect_to new_contact_path, alert: "Please complete the form before submitting."
    end
  end



  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :phone, :email, :message)
  end
end
