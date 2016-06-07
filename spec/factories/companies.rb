# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :company do
    user_id 1
    company_notes "MyText"
    twitter_handle "MyString"
    phone_number "MyString"
    address "MyText"
  end
end
