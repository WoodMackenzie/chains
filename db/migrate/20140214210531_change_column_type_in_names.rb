class ChangeColumnTypeInNames < ActiveRecord::Migration
  def change
    change_column :names, :nameable_type, :string
  end
end
