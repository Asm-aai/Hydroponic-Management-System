class CreateMeasurementValues < ActiveRecord::Migration[8.0]
  def change
    create_table :measurement_values do |t|
      t.integer :measurement_id, null: false
      t.integer :measurement_item_id, null: false
      t.decimal :value
      t.timestamps
    end
  end
end
