class QuotesController < ApplicationController

  def index
  end

  def new
    @products = Product.where(user_id: current_user.id)
  end

  def edit
    @quote = Quote.find_by(id: params[:id])
    @products = Product.where(user_id: current_user.id)
  end

  def update
    @quote = Quote.find_by(id: params[:id])
    @quote.update(quote_params)

    redirect_to "/quotes/#{@quote.id}"
  end

  def show
    @quote = Quote.find_by(id: params[:id])
  end
  
  def create
    @quote = Quote.new(
                      order_type: params[:order_type],
                      product_id: params[:product_id],
                      unit_price: params[:unit_price],
                      quantity: params[:quantity],
                      lead_time: params[:lead_time],
                      quantity_discount: params[:quantity_discount],
                      ship_from: params[:ship_from],
                      ship_method: params[:ship_method],
                      country_of_origin: params[:country_of_origin],
                      note_for_lead: params[:note_for_lead],
                      note_for_sales: params[:note_for_sales]
                      )
    if @quote.save!
      flash[:success] = "Your quote has been created."
    else
      flash[:error] = "Something went wrong. Quote was not updated"    
    end
    redirect_to "/quotes/#{@quote.id}"
  end

  private

    def quote_params
      params.permit(:order_type, :product_id, :unit_price, :quantity, :lead_time, :quantity_discount, :ship_from, :ship_method, :country_of_origin, :note_for_lead, :note_for_sales)
    end
end
