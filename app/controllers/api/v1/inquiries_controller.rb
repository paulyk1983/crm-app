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
    inquiry = Inquiry.create(
      user_id: 1,
      first_name: params[:first_name],
      last_name: params[:last_name],
      company_name: params[:company],
      email: params[:email],
      phone_number: params[:phone],
      zip_code: params[:zip_code],
      source: params[:source],
      product: params[:product],
      material: params[:material],
      color: params[:color],
      length: params[:length],
      width: params[:width],
      quantity: params[:quantity],
      lead_time: params[:lead_time],
      in_hand_date: params[:in_hand_date],
      application: params[:application],
      comment: params[:comment],
      ribbon_type: params[:ribbon_type],
      metal_end_type: params[:metal_end_type],
      bow_loop_type: params[:bow_loop_type],
      bow_size: params[:bow_size],
      attachment: params[:attachment]
    )

    # inquiry.send_request_alert(inquiry)
    inquiry.send_request_confirmation(inquiry)
    inquiry.send_request_alert(inquiry)
    

    redirect_to 'https://finishlinecorp.com/test-crm'
  end
end