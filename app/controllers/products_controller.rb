class ProductsController < ApplicationController

	def index
		@products = Product.all
	end

	def new
		@product = Product.new
	end

	def edit
		@product = Product.find_by(id: params[:id])
	end

	def create
		@product = Product.create(product_params.merge(user_id: current_user.id))
	end

	def update
		@product = Product.update(product_params)

		if @product.update
		  flash[:success] = "You've Updated A Product"
		  render :index
		else
		  flash.now[:danger] = "Something Went Wrong. Please Try Again"
		  render :show
		end
	end

	def show
		@product = Product.find_by(id: params[:id])
	end

	def destroy
		@product = Product.find_by(params[:id])

		if @product.destroy
		  flash[:success] = "Product Deleted."
		  render :index
		else
		  flash.now[:warning] = "Something Went Wrong. Please Try Again"
		  render :show
		end
	end

	private
	  # Using a private method to encapsulate the permissible parameters is
	  # a good pattern since you'll be able to reuse the same permit
	  # list between create and update. Also, you can specialize this method
	  # with per-user checking of permissible attributes.
	  def product_params
	    params.require(:product).permit(
	      :user_id, 
	    	:sku, 
	    	:unit_price, 
	    	:cost, 
	    	:short_description, 
	    	:description, 
	    	:vendor, 
	    	:category, 
	    	:qty_in_stock, 
	    	)
	  end
end
