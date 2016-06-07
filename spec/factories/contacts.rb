# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    user_id 1
    company_id 1
    email "MyString"
    first_name "MyString"
    last_name "MyString"
    phone_number "MyString"
    mailing_street "MyString"
    mailing_suite "MyString"
    mailing_city "MyString"
    mailing_state "MyString"
    mailing_zip "MyString"
    shipping_street "MyString"
    shipping_suite "MyString"
    shipping_city "MyString"
    shipping_state "MyString"
    shipping_zip "MyString"
    country "MyString"
    secondary_email "MyString"
    customer_notes "MyText"
    registered false
    subscribed false
    rating 1
    type ""
  end
end
