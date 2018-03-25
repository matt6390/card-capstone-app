class Deck < ApplicationRecord
  validates :name, presence: true
  validates :info, presence: true

  has_many :deck_cards
  has_many :cards, through: :deck_cards


  belongs_to :user

  def price
    total = 0
    cards.each do |card|
      total += card.average_price
    end
      return total
  end
end








