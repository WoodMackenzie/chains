class RemoveGranularitiesTable < ActiveRecord::Migration
  def up
    drop_table :location_granularities
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end