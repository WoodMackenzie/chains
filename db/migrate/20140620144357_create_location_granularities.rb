class CreateLocationGranularities < ActiveRecord::Migration
  def change
    create_table :location_granularities do |t|
      t.integer :user_id
      t.string :description

      t.timestamps
    end
  end
end
