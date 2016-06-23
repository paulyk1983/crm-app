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
      company: params[:company],
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

    body = inquiry.first_name + ' from ' + 'inquiry.company' + ' has requested a quote for ' + inquiry.material + ' ' + inquiry.product + ' 

    Quantity: ' + inquiry.quantity + ' 

    Lead Time: ' + inquiry.lead_time + ' 

    In Hand Date: ' + inquiry.in_hand_date.to_s + ' '

    Mail.defaults do
      delivery_method :smtp, {
        :address => 'smtp.gmail.com',
        :port => '587',
        :user_name => ENV['EMAIL_USER'],
        :password => ENV['EMAIL_PASSWORD'],
        :authentication => :plain
      }
    end

    Mail.new(
      :to => 'paulyk1983@gmail.com',
      :from => 'paulyk1983@gmail.com',
      :subject => 'New Quote Request',
      :body => body
    ).deliver!

    redirect_to 'https://finishlinecorp.com/test'
  end
end