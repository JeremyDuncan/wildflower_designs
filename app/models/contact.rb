class Contact < ApplicationRecord
  # Validations
  validates :first_name, presence: true
  validates :last_name,  presence: true
  validates :phone,      presence: true
  validates :email,      presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :message,    presence: true
end
