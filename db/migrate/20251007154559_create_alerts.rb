class CreateAlerts < ActiveRecord::Migration[8.0]
  def change
    create_table :alerts do |t|
      t.references :masurement_id, null: false, foreign_key: true
      t.integer :alert_type
      t.text :message
      t.boolean :resolved, default: false
      t.date :resolved_at
      t.timestamps
    end
  end
end
