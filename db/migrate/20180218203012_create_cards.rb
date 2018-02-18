class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :description
      t.string :element
      t.string :race
      t.string :rarity

      t.timestamps
    end
  end
end
