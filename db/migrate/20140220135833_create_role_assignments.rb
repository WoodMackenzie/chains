class CreateRoleAssignments < ActiveRecord::Migration
  def change
    create_table :role_assignments do |t|

      t.timestamps
    end
  end
end
