class CreateUnitsOfMeasures < ActiveRecord::Migration
  def change
    create_table :units_of_measures do |t|
      t.integer :user_id
      t.string :description
      t.integer :measure_type_id

      t.timestamps
    end
  end
end
