class CreatePlants < ActiveRecord::Migration[8.0]
  def change
    create_table :plants do |t|
      t.string :name
      t.date :planted_at
      t.date :harvested_at
      t.text :comment
      t.timestamps
    end
  end
end
