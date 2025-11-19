class Measurement < ApplicationRecord
  belongs_to :plant

  # enum :measurement_type, [ :temperature, :humidity, :ec, :ph ]
  # def measurement_type_i18n
  #   I18n.t("enums.measurement.measurement_type.#{measurement_type}")
  # end
end
