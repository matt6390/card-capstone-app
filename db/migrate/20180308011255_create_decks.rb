class CreateDecks < ActiveRecord::Migration[5.1]
  def change
    create_table :decks do |t|
      t.string :name
      t.text :info
      t.integer :user_id

      t.timestamps
    end
  end
end
