class AddUnitTypeToProcessingUnitTable < ActiveRecord::Migration
  def change
    add_column :processing_units, :unit_type_id, :integer
  end
end
