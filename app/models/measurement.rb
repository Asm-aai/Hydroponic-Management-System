class Measurement < ApplicationRecord
  belongs_to :plant
  has_many :measurement_values, dependent: :destroy
  accepts_nested_attributes_for :measurement_values
end
