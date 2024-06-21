require 'rails_helper'

RSpec.describe Image, type: :model do
  describe 'associations' do
    it { should belong_to(:product) }
  end

  describe 'callbacks' do
    it 'calls remove_image! before destroy' do
      image = create(:image) # Use factory to add image
      expect(image).to receive(:remove_image!).twice
      image.destroy
    end
  end
end
