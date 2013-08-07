# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :transaction do
    debit_uri "MyString"
    credit_uri "MyString"
    seller_id 1
    buyer_id 1
    product_id 1
    price "9.99"
    ship_price "9.99"
    ship_method "MyString"
  end
end
