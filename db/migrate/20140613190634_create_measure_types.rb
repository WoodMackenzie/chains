class CreateMeasureTypes < ActiveRecord::Migration
  def change
    create_table :measure_types do |t|
      t.integer :user_id
      t.string :description

      t.timestamps
    end
  end
end
