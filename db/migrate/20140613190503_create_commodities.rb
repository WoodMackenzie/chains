class CreateCommodities < ActiveRecord::Migration
  def change
    create_table :commodities do |t|
      t.integer :user_id
      t.string :description

      t.timestamps
    end
  end
end
