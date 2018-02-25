class ChangeValueInPricesToDecimal < ActiveRecord::Migration[5.1]
  def change
    change_column :prices, :value, "numeric USING CAST(value AS numeric)"
    change_column :prices, :value, :decimal, precision: 9, scale: 2
  end
end
