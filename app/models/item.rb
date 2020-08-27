class Item < ApplicationRecord
end

with_options presence: true do
  validates :name
  validates :image
  validates :item_description
  validates :item_condition
  validates :category
  validates :delivery_fee
  validates :price
  validates :shipping_area
  validates :shipping_days
end



has_one :purchase
belongs_to :user