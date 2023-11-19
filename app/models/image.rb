class Image < ApplicationRecord
  belongs_to :product
  mount_uploader :image, ImageUploader
  before_destroy :remove_image!


  private

  def remove_image!
    image.remove! if image
  end
end
