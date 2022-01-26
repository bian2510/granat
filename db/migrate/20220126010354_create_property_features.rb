class CreatePropertyFeatures < ActiveRecord::Migration[6.1]
  def change
    create_table :property_features do |t|
      t.float :total_area
      t.float :build_area
      t.integer :year_old
      t.integer :rooms
      t.integer :bathrooms
      t.integer :social_bathrooms
      t.integer :parking
      t.integer :trunk
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
