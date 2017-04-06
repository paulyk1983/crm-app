class QuotesController < ApplicationController

  def index
  end

  def new
  end

  def edit
  end

  def update
  end

  def show
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
end
