class CarModel < ApplicationRecord
  has_one_attached :image
  has_one_attached :thumbnail_image
  has_many :products

end