class DecksController < ApplicationController
  def index
    @decks = current_user.decks

    render 'index.json.jbuilder'
  end

  def show
    @deck = Deck.find(params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @deck = Deck.new(
                      name: params[:name],
                      info: params[:info],
                      user_id: current_user.id,
                    )
    if @deck.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @deck.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @deck = Deck.find(params[:id])

    @deck.name = params[:name] || @deck.name
    @deck.info = params[:info] || @deck.info
    
    if @deck.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @deck.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @deck = Deck.find(params[:id])
    @deck.destroy
    render json: { message: "Deck Successfull Destroyed"}
  end

end
