class Inquiry < ActiveRecord::Base
  belongs_to :user
  belongs_to :contact
  belongs_to :company
  has_many :quotes
  has_many :samples

  def send_request_alert(inquiry)
    body = inquiry.first_name + ' from ' + inquiry.company_name + ' has requested a quote for ' + inquiry.material + ' ' + inquiry.product + ' 

    Quantity: ' + inquiry.quantity + ' 

    Lead Time: ' + inquiry.lead_time + ' 

    In Hand Date: ' + inquiry.in_hand_date.to_s + ' 

    See all details: http://localhost:3000/inquiries/' + inquiry.id.to_s + ''

    Mail.defaults do
      delivery_method :smtp, {
        :address => 'smtp.gmail.com',
        :port => '587',
        :user_name => ENV['EMAIL_USER'],
        :password => ENV['EMAIL_PASSWORD'],
        :authentication => :plain
      }
    end

    Mail.new(
      :to => 'paulyk1983@gmail.com',
      :from => 'paulyk1983@gmail.com',
      :subject => 'New Quote Request',
      :body => body
    ).deliver!
  end
end
