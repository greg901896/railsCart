FactoryBot.define do
  factory :checkout do
    user_id { 1 }
    total_price { 1 }
    delivery { "MyString" }
  end
end
