class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.date :date
      t.string :weather
      t.string :wind
      t.float :temperature
      t.float :water_temperature
      t.time :start_time
      t.time :end_time
      t.integer :total_time
      t.string :country
      t.string :area
      t.string :point
      t.string :entry_type
      t.float :weight
      t.string :buddy
      t.string :visibility
      t.string :current
      t.float :max_depth
      t.float :avg_depth
      t.integer :start_bar
      t.integer :end_bar
      t.integer :bar_used
      t.string :image1
      t.string :image2
      t.text :comment
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
