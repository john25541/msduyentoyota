class Product < ApplicationRecord
  has_many :attachments, dependent: :destroy
  accepts_nested_attributes_for :attachments, reject_if: :all_blank, allow_destroy: true

  validates :name, :price, :year, :transmission, :body_type,
            :seats, :doors, :colors, :engine_size,
            :fuel, :origin , presence: true
end
