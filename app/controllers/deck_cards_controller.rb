class DeckCardsController < ApplicationController
  
  def create
    @deck_card = DeckCard.new(
                              deck_id: params[:deck_id],
                              user_card_id: params[:user_card_id],
                              )
    if @deck_card.save
      render json: @deck_card.as_json
    else
      render json: {errors: @deck_card.errors.full_messages}, status: :unprocessable_entity 
    end
  end

end
