FactoryBot.define do
  factory :image do
    association :product
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/assets/test_image.jpg'), 'image/jpeg') }
  end
end