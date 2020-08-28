class Item < ApplicationRecord

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

validates :name, length: { maximum: 40 }
validates :item_description, length: { maximum: 1000 }
validates :price, numericality: { :greater_than_or_equal_to => 300, :less_than_or_equal_to => 9999999 }

extend ActiveHash::Associations::ActiveRecordExtensions
has_one :purchase
belongs_to :user
has_one_attached :images
belongs_to_active_hash :category
belongs_to_active_hash :delivery_fee
belongs_to_active_hash :item_condition
belongs_to_active_hash :shipping_area
belongs_to_active_hash :shipping_days
end