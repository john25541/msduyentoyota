class Product < ApplicationRecord
  has_many :attachments, dependent: :destroy
  belongs_to :car_model

  accepts_nested_attributes_for :attachments, reject_if: :all_blank, allow_destroy: true

  validates :name, :price, :year, :transmission, :body_type,
            :seats, :doors, :colors, :engine_size,
            :fuel, :origin, :car_model_id , presence: true

end
