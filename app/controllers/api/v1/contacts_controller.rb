class Api::V1::ContactsController < ApplicationController
  def index
    if current_user
      @contacts = Contact.where(user_id: current_user.id)
      render 'index.json.jbuilder'
    else
      redirect_to '/'
    end
  end
end
