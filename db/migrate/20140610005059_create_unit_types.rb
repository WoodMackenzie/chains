class CreateUnitTypes < ActiveRecord::Migration
  def change
    create_table :unit_types do |t|
      t.integer :user_id
      t.string :description
      t.integer :parent_id

      t.timestamps
    end
  end
end
