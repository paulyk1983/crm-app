class Inquiry < ActiveRecord::Base
  belongs_to :user
  belongs_to :contact
  belongs_to :company
  has_many :quotes
  has_many :samples

  require 'sendgrid-ruby'
  include SendGrid

  def send_request_alert(inquiry, current_url)

    from = Email.new(email: 'info@finishlinecorp.com')
    to = Email.new(email: "#{inquiry.email}")
    subject = 'New Quote Request'

    File.open('app/templates/request_alert.html.erb', 'w') { |file| file.write(
      "<p>#{inquiry.first_name} from #{inquiry.company} has submitted a quote request.</p>
      <p>
        <strong>Product:</strong> #{inquiry.product}<br>
        <strong>Material:</strong> #{inquiry.material}<br>
        <strong>Quantity:</strong> #{inquiry.quantity}<br>
        <strong>Lead Time:</strong> #{inquiry.lead_time}<br>
        <strong>In Hand Date:</strong> #{inquiry.in_hand_date}<br>
        <strong>Zip Code:</strong> #{inquiry.zip_code}<br>
        <strong>Comment:</strong> #{inquiry.comment}<br> 
      </p>
      <p><a href='#{current_url}/inquiries/#{inquiry.id}?status=accept'>Accept Request</a></p>
      <p><a href='#{current_url}/inquiries/#{inquiry.id}?status=reject'>Reject Request</a></p>   "
      ) }

    message = File.read('app/templates/request_alert.html.erb')

    content = Content.new(type: 'text/html', value: message)
    mail = Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV["SENDGRID_API_KEY"])
    response = sg.client.mail._('send').post(request_body: mail.to_json)

    # Mail.defaults do
    #   delivery_method :smtp, {
    #     :address => 'smtp.gmail.com',
    #     :port => '587',
    #     :user_name => ENV['EMAIL_USER'],
    #     :password => ENV['EMAIL_PASSWORD'],
    #     :authentication => :plain
    #   }
    # end

    # Mail.new(
    #   :to => User.first.email,
    #   :from => 'finishlinedev@gmail.com',
    #   :subject => 'New Quote Request',
    #   :body => body,
    #   :content_type => 'text/html; charset=UTF-8'
    # ).deliver!
  end

  def send_request_confirmation(inquiry)

    contact_info = "<p>
        <strong>Name:</strong> #{inquiry.first_name}<br>
        <strong>Company:</strong> #{inquiry.company_name}<br>
        <strong>Email:</strong> #{inquiry.email}<br>
        <strong>Zip Code:</strong> #{inquiry.zip_code}<br>"
    if inquiry.phone_number
      contact_info += "<strong>Phone Number:</strong> #{inquiry.phone_number}<br></p>"
    else
      contact_info += "</p>"
    end

    product_info = "<p>
      <strong>Product Type:</strong> #{inquiry.product}<br>
      <strong>Material:</strong> #{inquiry.material}<br>
      <strong>Color:</strong> #{inquiry.color}<br>
      <strong>Length:</strong> #{inquiry.length}<br>
      <strong>Width:</strong> #{inquiry.width}"
    if inquiry.bow_size
      product_info += "<br><strong>Bow Size:</strong> #{inquiry.bow_size}"
    end
    if inquiry.attachment
      product_info += "<br><strong>Attachment Type:</strong> #{inquiry.attachment}"
    end
    product_info += "<br><strong>Application/Use:</strong> #{inquiry.application}
      <br><strong>Lead Time:</strong> #{inquiry.lead_time}"
    if inquiry.in_hand_date
      product_info += "<br><strong>In Hand Date:</strong> #{inquiry.in_hand_date.strftime('%m/%d/%Y')}</p>"
    else
      product_info += "</p>"
    end

    if inquiry.comment
      comment = "<div style='background-color:#f1ecf6; padding:15px;  margin-bottom:20px;'><h2>Comment:</h2><p>#{inquiry.comment}</p></div>"
    else
      comment = ""
    end

    social_media = '<p>Connect with us on these social networks:</p>
      <p>
        <a href="https://www.facebook.com/finishlinecorp" target="_blank">Facebook</a>
       | <a href="https://twitter.com/finishlineinc" target="_blank">Twitter</a>
        | <a href="https://plus.google.com/+Finishlinecorp/" target="_blank">Google +</a>
         | <a href="http://www.linkedin.com/company/finish-line-custom-finishing" target="_blank">LinkedIn</a> | 
         <a href="http://www.pinterest.com/finishlineinc/" target="_blank">Pinterest</a></p>'

    File.open('app/templates/request_confirmation.html.erb', 'w') { |file| file.write(
      "<p>Your quote request has been submitted and will be processed shortly. Please confirm the details below. You can reply to this email for any changes you would like to make to your request.</p>
      <div style='background-color:#f1ecf6; padding:15px; margin-bottom:20px;'>
        <h2>Contact Info:</h2>
        #{contact_info}
      </div>  
      <div style='background-color:#f1ecf6; padding:15px; margin-bottom:20px;'>
        <h2>Product Info:</h2>
        #{product_info}
      </div>        
      #{comment}      
      <p><img alt='Finish Line Custom Finishing Inc.' src='https://s3.amazonaws.com/ls-account-data-3-us-east-1/store-finish-line-custom-finishing-53e922c767901/themes/boxie/resources/img/logo%202014%20b%20small.jpg'>
      <br><strong>835 Sterling Ave.<br>Palatine, IL 60067</strong><br>(847) 729-7320<br></p>
      #{social_media}"
      ) }

    message = File.read('app/templates/request_confirmation.html.erb')
    from = Email.new(email: 'info@finishlinecorp.com')
    to = Email.new(email: "#{inquiry.email}")
    subject = 'Quote Request Confirmation'

    content = Content.new(type: 'text/html', value: message)
    mail = Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV["SENDGRID_API_KEY"])
    response = sg.client.mail._('send').post(request_body: mail.to_json)

    # Mail.defaults do
    #   delivery_method :smtp, {
    #     :address => 'smtp.gmail.com',
    #     :port => '587',
    #     :user_name => ENV['EMAIL_USER'],
    #     :password => ENV['EMAIL_PASSWORD'],
    #     :authentication => :plain
    #   }
    # end

    # Mail.new(
    #   :to => inquiry.email,
    #   :from => 'sales@finishlinecorp.com',
    #   :subject => 'Quote Request Confirmation',
    #   :body => body,
    #   :content_type => 'text/html; charset=UTF-8'
    # ).deliver!

  end

  
end