# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

MeasurementItem.destroy_all

MeasurementItem.create!([

  # ===== 施設内温度 =====
  {
    name: "facility_temperature",   # 内部識別名
    label: "施設内温度",             # 画面表示名
    unit: "℃",                      # 単位
    min_value: 18,                  # 下限値
    max_value: 25                   # 上限値
  },

  # ===== 養液水温 =====
  {
    name: "solution_temperature",
    label: "養液水温",
    unit: "℃",
    min_value: 18,
    max_value: 24
  },

  # ===== pH =====
  {
    name: "ph",
    label: "養液pH値",
    unit: "",
    min_value: 5.5,
    max_value: 6.9
  },

  # ===== EC =====
  {
    name: "ec",
    label: "EC値（μs/cm）",
    unit: "μs/cm",
    min_value: 2500,
    max_value: 3500
  },

  # ===== 湿度 =====
  {
    name: "facility_humidity",
    label: "施設内湿度",
    unit: "%",
    min_value: 50,
    max_value: 70
  },

  # ===== CO2 =====
  {
    name: "co2",
    label: "室内CO2濃度",
    unit: "ppm",
    min_value: 1000,
    max_value: nil   # 上限なし
  },

  # ===== 備考（数値ではないが一応項目として管理したい場合）=====
  {
    name: "note",
    label: "備考 / 特記事項",
    unit: "",
    min_value: nil,
    max_value: nil
  }

])
Admin.find_or_create_by!(email: "admin@example.com") do |admin|
  admin.password = "password"
end
