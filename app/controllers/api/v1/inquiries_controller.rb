class Api::V1::InquiriesController < ApplicationController
  def index
    if current_user
      @inquiries = Inquiry.where(user_id: current_user.id)
      render 'index.json.jbuilder'
    else
      redirect_to '/'
    end
  end

  def create  
    # ADD INQUIRY TO DATABASE
    inquiry = Inquiry.new(inquiry_params)

    # CHECK EMAIL TO SEE IF NEW LEAD
    repeat_inquiry = Inquiry.find_by(email: inquiry.email)
    if !repeat_inquiry
      inquiry.new_lead = true           
    else
      inquiry.new_lead = false
    end

    inquiry.save

    # inquiry.send_request_alert(inquiry)
    # inquiry.send_request_confirmation(inquiry)
    # inquiry.send_request_alert(inquiry)
    

    redirect_to 'https://finishlinecorp.com/test-crm'
  end

  private

    def inquiry_params
      params.permit(:first_name, :last_name, :company_name, :email, :phone_number, :zip_code, :product, :material, :color, :length, :width, :quantity, :lead_time, :in_hand_date, :comment, :application, :source, :status, :new_lead, :registered, :subscribed, :ribbon_type, :bow_size, :bow_loop_type, :metal_end_type, :attachment)
    end
end