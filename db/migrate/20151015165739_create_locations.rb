class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :town
      t.string :country
      t.float :lat
      t.float :lon

      t.timestamps null: false
    end
  end
end
