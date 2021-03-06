class Api::V1::CompaniesController < ApplicationController
  def index

    if current_user
      @companies = Company.where(user_id: current_user.id)
      render 'index.json.jbuilder'
    else
      redirect_to '/'
    end

  end

  def create  
    # ADD COMPANY TO DATABASE
    company = Company.create(company_params.merge(user_id: current_user.id))

    flash[:success] = "You have submitted a new company"
    redirect_to '/companies'
  
  end


  private

    def company_params
      params.permit(:user_id, :name, :twitter_handle, :company_notes, :address, :phone_number)
    end
end
