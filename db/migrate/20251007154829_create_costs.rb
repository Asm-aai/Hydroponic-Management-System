class CreateCosts < ActiveRecord::Migration[8.0]
  def change
    create_table :costs do |t|
      t.references :plant_id, null: false, foreign_key: true
      t.string :item_name
      t.decimal :amount
      t.timestamps
    end
  end
end
