class DeckCard < ApplicationRecord
  belongs_to :deck
  belongs_to :user_card
end
