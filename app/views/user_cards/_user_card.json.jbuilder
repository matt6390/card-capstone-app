json.user_card_id user_card.id


json.card do 
  json.partial! user_card.card, partial: 'cards/card', as: :card
end