class PricesController < ApplicationController
  def index
    @prices = Price.all
    search_term = params[:search]

    if search_term
      @prices = @prices.where("card_id = ?", params[:search])
    end
    
    render 'index.json.jbuilder' 
  end

  def create
    @price = Price.new(
                        card_id: params[:card_id],
                        style: params[:style],
                        condition: current_user.name,
                        source: params[:source],
                        value: params[:value]
                      )
    if @price.save
     render json: 'show.json.jbuilder'
    else
      render json: {errors: @price.errors.full_messages}, status: :unprocessable_entity
    end
  end
end
