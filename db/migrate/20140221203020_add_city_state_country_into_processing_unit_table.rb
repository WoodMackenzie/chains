class AddCityStateCountryIntoProcessingUnitTable < ActiveRecord::Migration
  def change
    add_column :processing_units, :city, :string
    add_column :processing_units, :state, :string
    add_column :processing_units, :country, :string
  end
end
