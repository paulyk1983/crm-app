class HomeController < ApplicationController
  def show
    if current_user
      redirect_to '/dashboard'
    end
  end
end