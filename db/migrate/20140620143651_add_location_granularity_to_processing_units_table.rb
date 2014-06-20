class AddLocationGranularityToProcessingUnitsTable < ActiveRecord::Migration
  def change
    add_column :processing_units, :location_granularity_id, :integer
    create_table :location_granularities do |t|
      t.integer :user_id
      t.string :description

      t.timestamps
    end
  end
end
