class AddFieldsToRolesAndRoleAssignments < ActiveRecord::Migration
  def change
    add_column :roles, :role, :string
    add_column :roles, :user_id, :integer
    add_column :role_assignments, :role_id, :integer
    add_column :role_assignments, :holder_id, :integer
    add_column :role_assignments, :holder_type, :string
    add_column :role_assignments, :subject_id, :integer
    add_column :role_assignments, :subject_type, :string
    add_column :role_assignments, :active_date, :date
    add_column :role_assignments, :share, :float
    add_column :role_assignments, :user_id, :integer
  end
end
