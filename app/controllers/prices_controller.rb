class PricesController < ApplicationController
  def index
    @prices = Price.all
    search_term = params[:search]

    if search_term
      @prices = @prices.where("card_id = ?", params[:search])
    end
    
    render json: @prices.as_json   
  end

  def create
    @price = Price.new(
                        card_id: params[:card_id],
                        style: params[:style],
                        condition: params[:condition],
                        source: params[:source],
                        value: params[:value]
                      )
    if @price.save
     render json: @price.as_json
    else
      render json: {errors: @price.errors.full_messages}, status: :unprocessable_entity
    end
  end
end
