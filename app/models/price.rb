class Price < ApplicationRecord
  validates :value, presence: true
  validates :source, presence: true

  belongs_to :card

  def friendly_created_at
    created_at.strftime("%e %b %Y %H:%M:%S%p")
  end

  def friendly_updated_at
    updated_at.strftime("%e %b %Y %H:%M:%S%p")
  end
end
