class CreateProjectDetailStrings < ActiveRecord::Migration
  def change
    create_table :project_detail_strings do |t|
      t.integer :user_id
      t.integer :project_id
      t.integer :project_category_id
      t.string :value

      t.timestamps
    end
  end
end
