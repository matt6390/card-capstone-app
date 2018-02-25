class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :user_cards
  has_many :cards, through: :user_cards

  has_many :comments

  def owned_cards
    user_cards.where(user_id: current_user.id)
  end

end
