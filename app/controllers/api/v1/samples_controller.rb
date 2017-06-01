  def index
    if current_user
      @samples = Sample.where(user_id: current_user.id)
      render 'index.json.jbuilder'
    else
      redirect_to '/'
    end
  end

    def create  
    # ADD SAMPLE TO DATABASE
    sample = Sample.create(sample_params.merge(user_id: current_user.id))

    flash[:success] = "Your sample has been submitted. You will receive a confirmation email shortly"
    redirect_to '/samples'
  
  end



  private

    def sample_params
      params.permit(:user_id, :contact_id, :company_id, :inquiry_id, :quote_id, :product_id, :name, :status, :note_to_receiver, :note_to_sales, :price, :lead_time, :street, :suite, :city, :state, :zip_code, :shipping_method, :drop_ship, :custom_color, :custom_length, :custom_width, :custom_other)
    end