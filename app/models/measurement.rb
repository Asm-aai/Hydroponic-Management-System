class Measurement < ApplicationRecord
  belongs_to :plant

  enum measurement_type: { temperature: 0, humidity: 1, ec: 2, ph: 3 }
end
