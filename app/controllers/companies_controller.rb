class CompaniesController < ApplicationController
	def index
		@companies = Company.all
	end

	def new
		@company = Company.new
	end

	def edit
		@company = Company.find_by(id: params[:id])
	end

	def create
		@company = Company.create(company_params.merge(user_id: current_user.id))

		if @company.save
		  flash[:success] = ["You Successfully Created The #{@company.name} Company"]
		  redirect_to '/companies'
		else
		  flash.now[:danger] = "Something Went Wrong. Please Try Again"
		  render :new
		end
	end

	def update
		@company = Company.find_by(id: params[:id])
		@company.update(company_params)

		if @product.save
		  flash[:success] = "You've Updated #{@company.name}"
		  render :show
		else
		  flash.now[:danger] = "Something Went Wrong. Please Try Again"
		  render :edit
		end

	end

	def show
		@company = Company.find_by(id: params[:id])
	end

	def destroy
		@company = Company.find_by(params[:id])

		if @company.destroy
		  flash[:success] = "Company Deleted."
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
	  def company_params
	    params.permit(
	    	:user_id,
	    	:company_notes, 
	    	:twitter_handle, 
	    	:phone_number,
	    	:address,
	    	:name,  
	    	)
	  end
end
