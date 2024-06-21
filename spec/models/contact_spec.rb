require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:message) }

    it 'validates format of email' do
      valid_email_contact = Contact.new(first_name: 'John', last_name: 'Doe', phone: '1234567890', email: 'john.doe@example.com', message: 'Hello')
      invalid_email_contact = Contact.new(first_name: 'John', last_name: 'Doe', phone: '1234567890', email: 'invalid_email', message: 'Hello')

      expect(valid_email_contact).to be_valid
      expect(invalid_email_contact).not_to be_valid
      expect(invalid_email_contact.errors[:email]).to include('is invalid')
    end
  end
end
