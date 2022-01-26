class AddAdminToProperties < ActiveRecord::Migration[6.1]
  def change
    add_reference :properties, :admin, null: false, foreign_key: true
  end
end
