class InquiriesController < ApplicationController
  def index

    # change with when importing a data from Zoho crm - will need to configure pagination
    @inquiries = Inquiry.all
  end

  def show
    @inquiry = Inquiry.find_by(id: params[:id])
    status = params[:status]
    if status == "reject" 
      if @inquiry.update(status: "rejected") 
        flash[:success] = 'This inquiry has been rejected. No further action required.'
        redirect_to "/inquiries/#{@inquiry.id}"
      else
        flash[:error] = 'Oh no, something went wrong. Inquiry has failed to update.'
        redirect_to "/inquiries/#{@inquiry.id}"
      end
    elsif status == "accept"
      if @inquiry.update(status: "accepted") 
        flash[:success] = "Success! Inquiry status has been updated to 'accepted'."
        redirect_to "/inquiries/#{@inquiry.id}"
      else
        flash[:error] = 'Oh no, something went wrong. Inquiry has failed to update.'
        redirect_to "/inquiries/#{@inquiry.id}"
      end
    end
  end

  def edit
    @inquiry = Inquiry.find_by(id: params[:id])
  end

  def update
    @inquiry = Inquiry.find_by(id: params[:id])
    @inquiry.update(inquiry_params)
    
    if @inquiry.save!
      flash[:success] = "Success! Inquiry has been updated."
    else
      flash[:error] = "Something went wrong. Inquiry was not updated"    
    end
    redirect_to "/inquiries/#{@inquiry.id}"
  end

  private

    def inquiry_params
      params.permit(:first_name, :last_name, :company_name, :email, :phone_number, :zip_code, :product, :material, :color, :length, :width, :quantity, :lead_time, :in_hand_date, :comment, :application, :source, :status, :new_lead, :registered, :subscribed, :ribbon_type, :bow_size, :bow_loop_type, :metal_end_type, :attachment)
    end
end