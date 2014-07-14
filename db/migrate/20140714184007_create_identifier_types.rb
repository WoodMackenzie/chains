class CreateIdentifierTypes < ActiveRecord::Migration
  def change
    create_table :identifier_types do |t|
      t.integer :user_id
      t.string :value

      t.timestamps
    end
  end
end
