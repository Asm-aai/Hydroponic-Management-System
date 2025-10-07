class CreateMasurements < ActiveRecord::Migration[8.0]
  def change
    create_table :masurements do |t|
      t.references :plant_id, null: false, foreign_key: true
      t.integer :measurement_type
      t.decimal :value
      t.date :measured_at
      t.timestamps
    end
  end
end
