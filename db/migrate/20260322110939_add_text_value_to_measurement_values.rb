class AddTextValueToMeasurementValues < ActiveRecord::Migration[8.0]
  def change
    add_column :measurement_values, :text_value, :text
  end
end
