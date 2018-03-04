class UserCardsController < ApplicationController

  def index
    @user_cards = current_user.user_cards

    render 'index.json.jbuilder'
  end

  def show
    @user_card = UserCard.where(card_id: params[:id])

    render 'show.json.jbuilder'
  end

  def create
    @user_card = UserCard.new(
                              user_id: current_user.id,
                              card_id: params[:card_id],
                              condition: params[:condition],
                              style: params[:style],
                              print_tag: params[:print_tag]
                              )
    if @user_card.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @user_cards.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @user_card = UserCard.find(params[:id])
    render 'show.json.jbuilder'
  end

  def destroy
    @user_card = UserCard.find_by(card_id: params[:id])
    @user_card.destroy
    render json: {message: "Card successfully destroyed"}
  end

end
