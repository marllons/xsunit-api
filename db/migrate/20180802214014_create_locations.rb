class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :latitude
      t.string :longitude
      t.references :survivor, foreign_key: true

      t.timestamps
    end
  end
end
