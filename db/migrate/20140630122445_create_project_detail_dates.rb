class CreateProjectDetailDates < ActiveRecord::Migration
  def change
    create_table :project_detail_dates do |t|
      t.integer :user_id
      t.integer :project_id
      t.integer :project_category_id
      t.date :value

      t.timestamps
    end
  end
end
