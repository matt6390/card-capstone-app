class CreateDeckCards < ActiveRecord::Migration[5.1]
  def change
    create_table :deck_cards do |t|
      t.integer :deck_id
      t.integer :user_card_id

      t.timestamps
    end
  end
end
