class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :province
      t.string :city
      t.string :municipality
      t.string :main_street
      t.string :secondary_street
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
