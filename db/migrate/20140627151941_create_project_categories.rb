class CreateProjectCategories < ActiveRecord::Migration
  def change
    create_table :project_categories do |t|
      t.integer :user_id
      t.string :category_type
      t.string :description

      t.timestamps
    end
  end
end
