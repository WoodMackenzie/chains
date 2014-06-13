class CreateThroughputs < ActiveRecord::Migration
  def change
    create_table :throughputs do |t|
      t.integer :user_id
      t.integer :unit_id
      t.integer :metric_id
      t.integer :amount_unit_id
      t.integer :time_unit_id
      t.integer :commodity_id
      t.date :active_date

      t.timestamps
    end
  end
end
