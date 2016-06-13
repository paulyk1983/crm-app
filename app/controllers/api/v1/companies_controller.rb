class Api::V1::CompaniesController < ApplicationController
  def index
    if current_user
      @companies = Company.where(user_id: current_user.id)
      render 'index.json.jbuilder'     
    else
      redirect_to '/'
    end  
  end 
end