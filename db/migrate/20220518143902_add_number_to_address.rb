class AddNumberToAddress < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :number, :integer
  end
end
