class AddActiveDateToComments < ActiveRecord::Migration
  def change
    add_column :comments, :active_date, :date
    change_column :role_assignments, :active_date, :date
  end
end
