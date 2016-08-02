class MessagesController < ApplicationController
  def new
    email = params[:email]
    status = params[:status]
  end

  def create
    body = File.read('app/templates/message.html.erb')

    Mail.defaults do
      delivery_method :smtp, {
        :address => 'smtp.zoho.com',
        :port => '587',
        :user_name => ENV['EMAIL_USER'],
        :password => ENV['EMAIL_PASSWORD'],
        :authentication => :plain
      }
    end

    Mail.new(
      :to => params[:receiver],
      :from => 'sales@finishlinecorp.com',
      :subject => 'Regarding your quote from Finish Line Inc.',
      :body => params[:message],
      :content_type => 'text/html; charset=UTF-8'
    ).deliver!

    flash[:success] = 'Your message has been sent.'
    redirect_to '/'
  end
end