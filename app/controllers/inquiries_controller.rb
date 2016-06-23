class InquiriesController < ApplicationController
  def show
    @inquiry = Inquiry.find_by(id: params[:id])
  end
end