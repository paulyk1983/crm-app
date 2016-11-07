class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    render 'index.html.erb'
  end

  def show
    @contact = Contact.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def edit
    @contact = Contact.find_by(id: params[:id])
  end

  def update
    @contact = Contact.find_by(id: params[:id])
    if @contact.update(
      email: params[:email],
      first_name: params[:first_name],
      last_name: params[:last_name],
      phone_number: params[:phone_number],
      mailing_street: params[:mailing_street],
      mailing_suite: params[:mailing_suite],
      mailing_city: params[:mailing_city],
      mailing_state: params[:mailing_state],
      mailing_zip: params[:mailing_zip],
      shipping_street: params[:shipping_street],
      shipping_suite: params[:shipping_suite],
      shipping_city: params[:shipping_city],
      shipping_state: params[:shipping_state],
      shipping_zip: params[:shipping_zip],
      country: params[:country],
      secondary_email: params[:secondary_email],
      customer_notes: params[:customer_notes]
      )
      flash[:success] = "Contact successfully updated!"
      redirect_to "/contacts/#{@contact.id}"
    else
      render "edit.html.erb"
    end
  end

  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy
    flash[:success] = "Contact successfully deleted!"
    redirect_to "/contacts"
  end
end
