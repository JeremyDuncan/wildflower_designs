class Product < ApplicationRecord
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  # Validation for presence
  validates :name, presence: true
  validates :price, presence: true, numericality: true
  validates :details, presence: true
end
