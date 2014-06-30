class EditProjectTables < ActiveRecord::Migration
  def change
    rename_column :project_detail_numericals, :units_of_measrure_id, :units_of_measure_id
    add_column :project_categories, :parent_id, :integer
  end
end
