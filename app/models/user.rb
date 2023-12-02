class User < ApplicationRecord
  has_many :cart_items, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validate      :email_allowed
  before_create :set_admin_status



  # Method to check if the user is an admin
  def admin?
    self.admin
  end

  private
  def email_allowed
    allowed_emails = ['jeremy.duncan1984@gmail.com', 'wildflowerdesigns0923@gmail.com'] # List allowed emails here
    errors.add(:email, "is not allowed") unless allowed_emails.include?(email.downcase)
  end

  def set_admin_status
    # Define the list of email addresses that should be admins
    admin_emails = ['jeremy.duncan1984@gmail.com', 'wildflowerdesigns0923@gmail.com']
    self.admin = admin_emails.include?(self.email)
  end
end