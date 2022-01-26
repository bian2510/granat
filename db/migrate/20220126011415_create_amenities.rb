class CreateAmenities < ActiveRecord::Migration[6.1]
  def change
    create_table :amenities do |t|
      t.boolean :bbq
      t.boolean :sport_zones
      t.boolean :gym
      t.boolean :pool
      t.boolean :comunal_room
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
