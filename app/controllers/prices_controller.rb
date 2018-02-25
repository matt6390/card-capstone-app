class PricesController < ApplicationController
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
