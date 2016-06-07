# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :quote do
    user_id 1
    contact_id 1
    company_id 1
    inquiry_id 1
    sample_id 1
    secondary_contact "MyString"
    name "MyString"
    number 1
    product "MyString"
    quantity 1
    unit_price "9.99"
    quantity_discount "MyString"
    order_type "MyString"
    note_for_sales "MyText"
    note_for_lead "MyText"
    lead_time "MyString"
    ship_from "MyString"
    ship_method "MyString"
    country_of_origin "MyString"
    valid_till "2016-06-07 15:56:14"
  end
end
