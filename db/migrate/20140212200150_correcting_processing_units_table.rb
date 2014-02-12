class CorrectingProcessingUnitsTable < ActiveRecord::Migration
  def change
    add_column :processing_units, :user_id, :integer
    add_column :processing_units, :latitude, :float
    add_column :processing_units, :longitude, :float
    remove_column :processing_units, :name
    remove_column :processing_units, :comment
  end
end
