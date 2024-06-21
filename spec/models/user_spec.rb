require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:cart_items).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:phone_number) }

    it 'validates that the email is allowed' do
      allowed_email = 'jeremy.duncan1984@gmail.com'
      disallowed_email = 'not.allowed@example.com'

      user_with_allowed_email = User.new(email: allowed_email, password: 'password', first_name: 'John', last_name: 'Doe', phone_number: '1234567890')
      user_with_disallowed_email = User.new(email: disallowed_email, password: 'password', first_name: 'John', last_name: 'Doe', phone_number: '1234567890')

      expect(user_with_allowed_email.valid?).to be true
      expect(user_with_disallowed_email.valid?).to be false
      expect(user_with_disallowed_email.errors[:email]).to include('is not allowed')
    end
  end

  describe 'callbacks' do
    it 'sets admin status before creating the user' do
      user = User.new(email: 'jeremy.duncan1984@gmail.com', password: 'password', first_name: 'John', last_name: 'Doe', phone_number: '1234567890')
      user.save
      expect(user.admin?).to be true
    end
  end

  describe '#admin?' do
    it 'returns true if the user is an admin' do
      user = User.new(admin: true)
      expect(user.admin?).to be true
    end

    it 'returns false if the user is not an admin' do
      user = User.new(admin: false)
      expect(user.admin?).to be false
    end
  end
end
