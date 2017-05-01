class Quote < ActiveRecord::Base
  belongs_to :user
  belongs_to :contact
  belongs_to :company
  belongs_to :inquiry
  belongs_to :product

  require 'sendgrid-ruby'
  include SendGrid

  def send_email(quote, url)

    from = Email.new(email: 'info@finishlinecorp.com')
    to = Email.new(email: "#{quote.email}")
    subject = 'New Quote Sent'

    message = "Hey, your quote has been sent."

    content = Content.new(type: 'text/html', value: message)
    mail = Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV["SENDGRID_API_KEY"])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
  end

end
