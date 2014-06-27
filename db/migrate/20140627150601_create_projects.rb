class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :user_id
      t.string :projectable_type
      t.integer :projectable_id

      t.timestamps
    end
  end
end
