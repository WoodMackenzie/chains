class CreateThroughputMetrics < ActiveRecord::Migration
  def change
    create_table :throughput_metrics do |t|
      t.integer :user_id
      t.string :description

      t.timestamps
    end
  end
end
