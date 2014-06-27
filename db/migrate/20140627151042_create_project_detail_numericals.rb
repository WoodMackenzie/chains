class CreateProjectDetailNumericals < ActiveRecord::Migration
  def change
    create_table :project_detail_numericals do |t|
      t.integer :user_id
      t.integer :project_id
      t.integer :project_category_id
      t.float :value
      t.integer :units_of_measrure_id

      t.timestamps
    end
  end
end
