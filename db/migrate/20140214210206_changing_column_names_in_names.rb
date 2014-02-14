class ChangingColumnNamesInNames < ActiveRecord::Migration
  def change
    rename_column :names, :target_type, :nameable_type
    rename_column :names, :target_id, :nameable_id
  end
end
