class RenameUnitIdColumnInThroughputs < ActiveRecord::Migration
  def change
    rename_column :throughputs, :unit_id, :processing_unit_id
  end
end
