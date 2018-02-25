class CreatePrices < ActiveRecord::Migration[5.1]
  def change
    create_table :prices do |t|
      t.integer :card_id
      t.string :style
      t.string :condition
      t.string :source

      t.timestamps
    end
  end
end
