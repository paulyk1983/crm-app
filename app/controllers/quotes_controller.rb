class QuotesController < ApplicationController

  def index
  end

  def new
    @products = Product.where(user_id: current_user.id)
    @contacts = Contact.where(user_id: current_user.id)
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

    if !params[:inquiry_id]
      inquiry_id = 1
    else
      inquiry_id = params[:inquiry_id]
    end
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
                      note_for_sales: params[:note_for_sales],
                      user_id: current_user.id,
                      inquiry_id: params[:inquiry_id]
                      )

    if @quote.save!
      flash[:success] = "Your quote has been created."
    else
      flash[:error] = "Something went wrong. Quote was not updated"    
    end
    redirect_to "/quotes/#{@quote.id}"
  end

  def send_quote

    current_url = request.base_url

    quote = Quote.find_by(id: params[:id])
    quote.send_email(quote, current_url)

    flash[:succes] = "Your quote has been sent."
    # flash[:error] = "Something went horribly wrong. Your quote was not sent."

    redirect_to "/quotes/"
  end

  private

    def quote_params
      params.permit(:order_type, :product_id, :unit_price, :quantity, :lead_time, :quantity_discount, :ship_from, :ship_method, :country_of_origin, :note_for_lead, :note_for_sales)
    end
end
