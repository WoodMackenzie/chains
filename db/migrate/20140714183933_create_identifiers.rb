class CreateIdentifiers < ActiveRecord::Migration
  def change
    create_table :identifiers do |t|
      t.integer :user_id
      t.integer :identifier_type_id
      t.string :value

      t.timestamps
    end
  end
end
