class AddValueToThroughputsTable < ActiveRecord::Migration
  def change
    add_column :throughputs, :value, :float
  end
end
