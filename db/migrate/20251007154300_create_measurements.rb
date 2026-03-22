class CreateMeasurements < ActiveRecord::Migration[8.0]
  def change
    create_table :measurements do |t|
      t.integer :plant_id, null: false
      t.date :measured_at
      t.boolean :water_changed
      t.text :mold_pest_status # カビ・害虫の状態
      t.text :root_status1 # 根の状態1
      t.text :root_status2 # 根の状態2
      t.text :root_status3 # 根の状態3
      t.text :root_status4 # 根の状態4
      t.text :leaf_status # 葉の状態
      t.date :thinning_date # 間引き日
      t.text :comment # 備考
      t.timestamps
    end
  end
end
