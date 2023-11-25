class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validate :email_allowed

  private

  def email_allowed
    allowed_emails = ['jeremy.duncan1984@gmail.com', 'wildflowerdesigns0923@gmail.com'] # List allowed emails here
    errors.add(:email, "is not allowed") unless allowed_emails.include?(email.downcase)
  end
end