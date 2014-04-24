class AddUserIdToUnitTypes < ActiveRecord::Migration
  def change
    add_column :unit_types, :user_id, :integer
  end
end
