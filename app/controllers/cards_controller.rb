class CardsController < ApplicationController
  def index
    cards = Card.all
    render json: cards.as_json
  end

  def show
    card = Card.find_by(params[:id])

    render json: card.as_json
  end

  def create
    card = Card.new(
                    name: params[:name],
                    description: params[:description],
                    element: params[:element],
                    race: params[:race],
                    rarity: params[:rarity]
                   )
    if card.save
     render json: card.as_json
   else
    render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end
end
