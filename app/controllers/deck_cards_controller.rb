class DeckCardsController < ApplicationController
  def index
    @deck_cards = DeckCard.all 
    render "index.json.jbuilder"
  end

  def create
    @deck_card = DeckCard.new(
                              deck_id: params[:deck_id],
                              card_id: params[:card_id],
                              )
    if @deck_card.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @deck_card.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @deck_card = DeckCard.find_by(deck_id: params[:id])
    @deck_card.delete
    render json: {message: "Card successfully removed from the deck"}
  end

end
