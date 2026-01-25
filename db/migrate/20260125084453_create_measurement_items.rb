class CreateMeasurementItems < ActiveRecord::Migration[8.0]
  def change
    create_table :measurement_items do |t|
      t.string :name, null: false # 内部名
      t.string :label, null: false # 表示名
      t.string :unit, null: false # °C, %, ppm など
      t.decimal :min_value # 最小値
      t.decimal :max_value # 最大値
      t.timestamps
    end
  end
end
