class CreateUserCards < ActiveRecord::Migration[5.1]
  def change
    create_table :user_cards do |t|
      t.integer :user_id
      t.integer :card_id
      t.string :condition
      t.string :style
      t.string :print_tag

      t.timestamps
    end
  end
end
