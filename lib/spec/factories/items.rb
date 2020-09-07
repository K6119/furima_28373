FactoryBot.define do
  factory :item do
    name { 'ダダダ' }
    images { 'public/images/PENTAFANPK009_TP_V.jpg' }
    item_description { 1 }
    item_condition_id { 2 }
    category_id { 2 }
    delivery_fee_id { 2 }
    price { 1111 }
    shipping_area_id { 2 }
    shipping_days_id { 2 }
    association :user
  end
end
