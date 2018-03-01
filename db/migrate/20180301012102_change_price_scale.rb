class ChangePriceScale < ActiveRecord::Migration[5.1]
  def change
    change_column :prices, :value, :decimal, precision: 11, scale: 2
  end
end
