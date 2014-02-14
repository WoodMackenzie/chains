class CreateNames < ActiveRecord::Migration
  def change
    create_table :names do |t|
      t.integer :target_id
      t.integer :target_type
      t.integer :user_id
      t.date :active_date
      t.string :name

      t.timestamps
    end
  end
end
