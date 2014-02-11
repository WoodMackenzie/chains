class CreateProcessingUnits < ActiveRecord::Migration
  def change
    create_table :processing_units do |t|
      t.string :name
      t.text :comment

      t.timestamps
    end
  end
end
