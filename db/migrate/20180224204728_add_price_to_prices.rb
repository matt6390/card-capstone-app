class AddPriceToPrices < ActiveRecord::Migration[5.1]
  def change
    add_column :prices, :value, :decimal, precision: 8, scale: 2 
  end
end
