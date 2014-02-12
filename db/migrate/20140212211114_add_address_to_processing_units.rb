class AddAddressToProcessingUnits < ActiveRecord::Migration
  def change
    add_column :processing_units, :address, :string
  end
end
