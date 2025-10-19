class CreateMeasurements < ActiveRecord::Migration[8.0]
  def change
    create_table :measurements do |t|
      t.references :plant, null: false, foreign_key: true
      t.integer :measurement_type
      t.decimal :value
      t.date :measured_at
      t.timestamps
    end
  end
end
