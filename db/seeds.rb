# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

MeasurementItem.create!([
  { name: "facility_temperature", label: "施設内温度", unit: "℃", min_value: 18, max_value: 25 },
  { name: "nutrient_water_temperature", label: "養液水温", unit: "℃", min_value: 18, max_value: 24 },
  { name: "ph", label: "養液pH値", unit: "", min_value: 5.5, max_value: 6.9 },
  { name: "ec", label: "EC値", unit: "μs/cm", min_value: 2500, max_value: 3500 },
  { name: "facility_humidity", label: "施設内湿度", unit: "%", min_value: 50, max_value: 70 },
  { name: "co2", label: "室内CO2濃度", unit: "ppm", min_value: 1000, max_value: nil }
])