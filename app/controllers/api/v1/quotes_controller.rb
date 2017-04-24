class Api::V1::QuotesController < ApplicationController
  def index
    if current_user
      @quotes = Quote.where(user_id: current_user.id)
      render 'index.json.jbuilder'
    else
      redirect_to '/'
    end
  end



  private

    def quote_params
      params.permit(:order_type, :product_id, :unit_price, :quantity, :lead_time, :quantity_discount, :ship_from, :ship_method, :country_of_origin, :note_for_lead, :note_for_sales)
    end
end