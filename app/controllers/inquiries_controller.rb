class InquiriesController < ApplicationController
  def show
    @inquiry = Inquiry.find_by(id: params[:id])
    status = params[:status]
    if status == "reject" 
      @inquiry.update(status: "rejected")  
      flash[:success] = 'This inquiry has been rejected. No further action required.'
      redirect_to "/inquiries/#{@inquiry.id}"
    end
  end

  def edit
    @inquiry = Inquiry.find_by(id: params[:id])
  end

  # def update
  #   @inquiry = Inquiry.find_by(id: params[:id])
  #   status = params[:status]
  #   if status == "reject" 
  #     @inquiry.update(status: "rejected")  
  #   end
    
  #   redirect_to "/inquiries/#{@inquiry.id}"
  # end
end