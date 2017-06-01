class SamplesController < ApplicationController
		def index
			@samples = Sample.all
		end

		def new
			@sample = Sample.new
		end

		def edit
			@sample = Sample.find_by(id: params[:id])
		end

		def create
			@sample = Sample.create(sample_params.merge(user_id: current_user.id))

			if @sample.save
			  flash[:success] = ["You Successfully Created #{@sample.name}"]
			  redirect_to '/samples'
			else
			  flash.now[:danger] = "Something Went Wrong. Please Try Again"
			  render :new
			end
		end

		def update
			@sample = Sample.find_by(id: params[:id])
			@sample.update(sample_params)

			if @sample.save
			  flash[:success] = "You've Updated #{@sample.name}"
			  render :show
			else
			  flash.now[:danger] = "Something Went Wrong. Please Try Again"
			  render :edit
			end

		end

		def show
			@sample = Sample.find_by(id: params[:id])
		end

		def destroy

			@sample = Sample.find_by(id: params[:id])
	    @sample.destroy
	    flash[:success] = 'sample successfully deleted!'
	    redirect_to '/samples'
			
		end

		private
		  # Using a private method to encapsulate the permissible parameters is
		  # a good pattern since you'll be able to reuse the same permit
		  # list between create and update. Also, you can specialize this method
		  # with per-user checking of permissible attributes.
		  def sample_params
		    params.permit(
		    	:user_id,
		    	:contact_id, 
		    	:company_id, 
		    	:inquiry_id, 
		    	:quote_id, 
		    	:product_id, 
		    	:name, 
		    	:status, 
		    	:note_to_receiver, 
		    	:note_to_sales, 
		    	:price, 
		    	:lead_time, 
		    	:street, 
		    	:suite,
		    	:city, 
		    	:state, 
		    	:zip_code, 
		    	:shipping_method, 
		    	:drop_ship, 
		    	:custom_color, 
		    	:custom_length, 
		    	:custom_width, 
		    	:custom_other, 
		    	)
		  end
end
