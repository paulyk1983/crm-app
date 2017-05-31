class Api::V1::ProductsController < ApplicationController
  def index
    @products = Product.all
    render 'index.json.jbuilder'

  end

  def create  
    # ADD PRODUCT TO DATABASE
    product = Product.create(product_params.merge(user_id: current_user.id))
    product.save

    flash[:success] = "Your product has been submitted. You will receive a confirmation email shortly"
    redirect_to '/products'
  
  end


  private

    def product_params
      params.permit(:user_id, :sku, :short_description, :description, :category, :vendor, :cost, :unit_price, :qty_in_stock)
    end
end