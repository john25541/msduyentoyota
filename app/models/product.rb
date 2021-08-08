class Product < ApplicationRecord

  has_many_attached :images

  validates :name, :price, :year, :transmission, :body_type,
            :seats, :doors, :colors, :engine_size,
            :fuel, :origin , presence: true
end
