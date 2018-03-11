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

end
