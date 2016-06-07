# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    user_id 1
    sku "MyString"
    unit_price "9.99"
    cost "9.99"
    short_description "MyString"
    description "MyText"
    vendor "MyString"
    category "MyString"
    qty_in_stock 1
  end
end
