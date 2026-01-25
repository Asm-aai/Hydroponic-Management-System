class MeasurementValue < ApplicationRecord
  belongs_to :measurement
  belongs_to :measurement_item
end
