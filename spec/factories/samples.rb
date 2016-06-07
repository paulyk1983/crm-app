# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sample do
    user_id 1
    contact_id 1
    company_id 1
    inquiry_id 1
    quote_id 1
    product_id 1
    name "MyString"
    status "MyString"
    note_to_receiver "MyText"
    note_to_sales "MyText"
    price "MyString"
    lead_time "MyString"
    street "MyString"
    suite "MyString"
    city "MyString"
    state "MyString"
    zip_code "MyString"
    shipping_method "MyString"
    drop_ship false
    custom_color "MyString"
    custom_length "MyString"
    custom_width "MyString"
    custom_other "MyString"
  end
end
