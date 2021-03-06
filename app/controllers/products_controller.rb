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

		if @product.save
		  flash[:success] = ["You Successfully Created #{@product.short_description}"]
		  redirect_to '/products'
		else
		  flash.now[:danger] = "Something Went Wrong. Please Try Again"
		  render :new
		end
	end

	def update
		@product = Product.find_by(id: params[:id])
		@product.update(product_params)

		if @product.save
		  flash[:success] = "You've Updated #{@product.short_description}"
		  render :show
		else
		  flash.now[:danger] = "Something Went Wrong. Please Try Again"
		  render :edit
		end

	end

	def show
		@product = Product.find_by(id: params[:id])
	end

	def destroy

		@product = Product.find_by(id: params[:id])
    @product.destroy
    flash[:success] = 'Product successfully deleted!'
    redirect_to '/products'
		
	end

	private
	  # Using a private method to encapsulate the permissible parameters is
	  # a good pattern since you'll be able to reuse the same permit
	  # list between create and update. Also, you can specialize this method
	  # with per-user checking of permissible attributes.
	  def product_params
	    params.permit(
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
