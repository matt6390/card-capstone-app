class Deck < ApplicationRecord
  has_many :deck_cards
  has_many :user_cards, through: :deck_cards


  belongs_to :user
end
