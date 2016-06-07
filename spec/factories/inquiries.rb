# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :inquiry do
    user_id 1
    contact_id 1
    company_id 1
    first_name "MyString"
    last_name "MyString"
    email "MyString"
    company "MyString"
    zip_code "MyString"
    source "MyString"
    stage "MyString"
    product "MyString"
    material "MyString"
    color "MyString"
    width "MyString"
    length "MyString"
    quantity "MyString"
    lead_time "MyString"
    application "MyText"
    new_lead false
    registered false
    subscribed false
    comment "MyText"
  end
end
