FactoryBot.define do
  factory :order_item do
    title { "MyString" }
    price { 1 }
    count_cart { 1 }
    user_id { 1 }
    order_id { "MyString" }
  end
end
