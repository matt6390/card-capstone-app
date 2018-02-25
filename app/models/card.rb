class Card < ApplicationRecord
  has_many :user_cards
  has_many :users, through: :user_cards

  has_many :prices
  has_many :comments
end
