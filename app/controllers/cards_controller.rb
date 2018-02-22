class CardsController < ApplicationController
  def index
    @cards = Card.all
    render json: @cards.as_json
  end

  def show
    @card = Card.find(params[:id])
    render json: @card.as_json
  end

  def create
    @card = Card.new(
                    name: params[:name],
                    description: params[:description],
                    element: params[:element],
                    race: params[:race],
                    rarity: params[:rarity]
                   )
    if @card.save
     render json: @card.as_json
    else
      render json: {errors: @card.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @card = Card.find(params[:id])

    @card.name = params[:name] || @card.name
    @card.description = params[:description] || @card.description
    @card.element = params[:element] || @card.element
    @card.race = params[:race] || @card.race
    @card.rarity = params[:rarity] || @card.rarity

    if @card.save
     render json: @card.as_json
    else
      render json: {errors: @card.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    render json: {message: "Card successfully destroyed"}
  end
end
