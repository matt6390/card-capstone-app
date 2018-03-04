class CardsController < ApplicationController
  def index
    @cards = Card.all
    search_term = params[:search]

    if search_term
      @cards = @cards.where("name iLike ?", "%#{search_term}%")
    end

    sort_attribute = params[:sort]
    if sort_attribute
      @cards = @cards.order(sort_attribute => :asc)
    end

    render 'index.json.jbuilder'  
  end

  def show
    @card = Card.find(params[:id])
    render 'show.json.jbuilder'
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
     render 'show.json.jbuilder'
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
     render 'show.json.jbuilder'
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
