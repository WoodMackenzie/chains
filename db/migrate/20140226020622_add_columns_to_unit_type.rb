class AddColumnsToUnitType < ActiveRecord::Migration
  def self.up
    add_column :unit_types, :description, :string
    add_column :unit_types, :ancestry, :string
    add_index :unit_types, :ancestry
  end
  def self.down
    remove_index :unit_types, :ancestry
    remove_column :unit_types, :ancestry
  end
end
