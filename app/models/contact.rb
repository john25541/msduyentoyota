class Contact < ApplicationRecord
    validates :name, :phone_number, :message, presence: true
    validates :phone_number, numericality: true,
                            length: {minimum: 10, maximum: 15}
end
