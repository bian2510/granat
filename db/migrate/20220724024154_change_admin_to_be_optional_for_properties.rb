class ChangeAdminToBeOptionalForProperties < ActiveRecord::Migration[6.1]
  def change
    change_column :properties, :admin_id, :integer, null: true
  end
end
