class CreateMeasurements < ActiveRecord::Migration[8.0]
  def change
    create_table :measurements do |t|
      t.references :plant, null: false, foreign_key: true
      t.decimal :temperature
      t.decimal :humidity
      t.decimal :ec
      t.decimal :ph
      t.decimal :CO2
      t.date :measured_at
      t.text :comment
      t.timestamps
    end
  end
end