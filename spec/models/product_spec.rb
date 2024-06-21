require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'associations' do
    it { should have_many(:images).dependent(:destroy) }
    it { should have_many(:cart_items).dependent(:destroy) }
    it { should accept_nested_attributes_for(:images).allow_destroy(true) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
    it { should validate_numericality_of(:price) }
    it { should validate_presence_of(:details) }
  end
end