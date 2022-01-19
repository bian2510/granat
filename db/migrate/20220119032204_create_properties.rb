class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :kind
      t.string :operation

      t.timestamps
    end
  end
end
