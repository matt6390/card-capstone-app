class Card < ApplicationRecord
  # validates :name, length: { minimum: 1 }
  # validates :description, length: { minimum: 1 }
  # validates :attribute, length: { minimum: 1 }
  # validates :race, length: { minimum: 1 }
  # validates :rarity, length: { minimum: 1 }

  has_many :user_cards
  has_many :users, through: :user_cards

  has_many :deck_cards
  has_many :decks, through: :deck_cards

  has_many :prices
  has_many :comments

  def friendly_created_at
    created_at.strftime("%e %b %Y %H:%M:%S%p")
  end

  def friendly_updated_at
    updated_at.strftime("%e %b %Y %H:%M:%S%p")
  end

  def average_price
    prices.average(:value).to_i
  end
end
