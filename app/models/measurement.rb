class Measurement < ApplicationRecord
  belongs_to :plant
  has_many :measurement_values, dependent: :destroy
  has_many :measurement_items, through: :measurement_values
  accepts_nested_attributes_for :measurement_values
end
