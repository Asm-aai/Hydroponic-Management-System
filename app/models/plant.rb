class Plant < ApplicationRecord
  has_many :measurements, dependent: :destroy
  has_many :cart_items
  # has_many :image
  has_one_attached :image
end
