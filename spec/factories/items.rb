FactoryBot.define do
  factory :item do
    name { "ダダダ" }
    image { "public/images/https://cdn.pixabay.com/photo/2020/04/25/20/33/mountain-5092625_1280.jpg" }
    item_description_id { 1 }
    item_condition_id { 1 }
    category_id { 1 }
    delivery_fee_id { 1 }
    price { 1111 }
    shipping_area_id { 1 }
    shipping_days_id { 1 }
    association :user
  end
end
