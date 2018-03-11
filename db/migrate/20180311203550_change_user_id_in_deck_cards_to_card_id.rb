class ChangeUserIdInDeckCardsToCardId < ActiveRecord::Migration[5.1]
  def change
     rename_column :deck_cards, :user_card_id, :card_id
  end
end
