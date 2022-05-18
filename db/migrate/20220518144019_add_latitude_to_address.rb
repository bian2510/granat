class AddLatitudeToAddress < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :latitude, :float
  end
end
