class AddCurrencyToProperty < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :currency, :string
  end
end
